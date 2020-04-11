module LogRollerCompose

using LogRoller, LogCompose, Logging
import LogCompose: logcompose, log_min_level

log_assumed_level(logger_config::Dict{String,Any}, default::String="Info") = getproperty(Logging, Symbol(get(logger_config, "assumed_level", default)))

function logcompose(::Type{LogRoller.RollingLogger}, config::Dict{String,Any}, logger_config::Dict{String,Any})
    filename = String(strip(logger_config["filename"]))
    @assert !isempty(filename)

    level = log_min_level(logger_config, "Info")
    sizelimit = get(logger_config, "sizelimit", 10240000)
    nfiles = get(logger_config, "nfiles", 5)
    timestamp_identifier = Symbol(get(logger_config, "timestamp_identifier", "time"))

    LogRoller.RollingLogger(filename, sizelimit, nfiles, level; timestamp_identifier=timestamp_identifier)
end

function logcompose(::typeof(LogRoller.RollingFileWriterTee), config::Dict{String,Any}, logger_config::Dict{String,Any})
    filename = String(strip(logger_config["filename"]))
    @assert !isempty(filename)

    level = log_assumed_level(logger_config, "Info")
    sizelimit = get(logger_config, "sizelimit", 10240000)
    nfiles = get(logger_config, "nfiles", 5)
    destination_name = logger_config["destination"]
    destination = LogCompose.logger(config, destination_name)
    LogRoller.RollingFileWriterTee(filename, sizelimit, nfiles, destination, level)
end

function logcompose(::typeof(LogRoller.RollingFileWriter), config::Dict{String,Any}, logger_config::Dict{String,Any})
    filename = String(strip(logger_config["filename"]))
    @assert !isempty(filename)

    level = log_assumed_level(logger_config, "Info")
    sizelimit = get(logger_config, "sizelimit", 10240000)
    nfiles = get(logger_config, "nfiles", 5)
    LogRoller.RollingFileWriter(filename, sizelimit, nfiles)
end

end # module
