using LogCompose, Test, Logging, LogRoller, LogRollerCompose

function test()
    config = joinpath(@__DIR__, "testapp.toml")
    rotated_logfile = "testapp.log"
    rotated_plain_logfile = "testplain.log"
    rm(rotated_logfile; force=true)
    rm(rotated_plain_logfile; force=true)

    let logger = LogCompose.logger(config, "testapp"; section="loggers")
        with_logger(logger) do
            @info("testroller")
        end
        @test isfile(rotated_logfile)
    end

    let logger = LogCompose.logger(config, "plainfile"; section="loggers")
        julia = joinpath(Sys.BINDIR, "julia")
        cmd = pipeline(`$julia -e 'println("testplainfilewriter"); flush(stdout)'`; stdout=logger, stderr=logger)
        run(cmd)
    end

    log_file_contents = readlines(rotated_logfile)
    @test findfirst("testroller", log_file_contents[1]) !== nothing

    log_file_contents = readlines(rotated_plain_logfile)
    @test "testplainfilewriter" == log_file_contents[1]

    try
        rm(rotated_logfile; force=true)
        rm(rotated_plain_logfile; force=true)
    catch ex
        # ignore errors due to file handles being busy on Windows
    end
end

test()
