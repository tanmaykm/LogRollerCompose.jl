# LogRollerCompose

[![Build Status](https://travis-ci.org/tanmaykm/LogRollerCompose.jl.png)](https://travis-ci.org/tanmaykm/LogRollerCompose.jl) 
[![Coverage Status](https://coveralls.io/repos/github/tanmaykm/LogRollerCompose.jl/badge.svg?branch=master)](https://coveralls.io/github/tanmaykm/LogRollerCompose.jl?branch=master)

Provides plugins to allow logger provided by [LogRoller](https://github.com/tanmaykm/LogRoller.jl) to be used with [LogCompose](https://github.com/tanmaykm/LogCompose.jl).

The following logger types can be composed with this package:
- LogRoller.RollingLogger
- LogRoller.RollingFileWriter
- LogRoller.RollingFileWriterTee

Example configurations:

```toml
[loggers.rollinglogger]
type = "LogRoller.RollingLogger"
filename = "/tmp/testapp.log"
# sizelimit = 10240000
# nfiles = 5
# min_level = "Debug"                   # Debug, Info (default) or Error
# timestamp_identifier = "time"

[loggers.rollingfile]
type = "LogRoller.RollingFileWriter"
filename = "/tmp/testplain.log"
# sizelimit = 10240000
# nfiles = 5
# assumed_level = "Debug"                 # Debug, Info (default) or Error

[loggers.rollingfiletee]
type = "LogRoller.RollingFileWriterTee"
destination = "testapp"
filename = "/tmp/testapptee.log"
# sizelimit = 10240000
# nfiles = 5
# assumed_level = "Debug"                 # Debug, Info (default) or Error
```

Check documentation of [LogRoller](https://github.com/tanmaykm/LogRoller.jl) for more details about parameter values.
