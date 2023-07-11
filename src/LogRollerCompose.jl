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
    format = Symbol(get(logger_config, "format", "console"))
    @assert format in (:json, :console)
    entry_size_limit = get(logger_config, "entry_sizelimit", LogRoller.DEFAULT_MAX_LOG_ENTRY_SIZE)
    @assert entry_size_limit > 0
    timestamp_identifier = Symbol(get(logger_config, "timestamp_identifier", "time"))

    LogRoller.RollingLogger(filename, sizelimit, nfiles, level; timestamp_identifier=timestamp_identifier, format=format, entry_size_limit=entry_size_limit)
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
