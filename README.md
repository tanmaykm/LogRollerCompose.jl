# LogRollerCompose

[![Build Status](https://travis-ci.org/tanmaykm/LogRollerCompose.jl.png)](https://travis-ci.org/tanmaykm/LogRollerCompose.jl) 
[![Build Status](https://ci.appveyor.com/api/projects/status/github/tanmaykm/LogRollerCompose.jl?branch=master&svg=true)](https://ci.appveyor.com/project/tanmaykm/logrollercompose-jl/branch/master) 
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
filename = "testapp.log"
# sizelimit = 10240000
# entry_sizelimit = 262144
# nfiles = 5
# min_level = "Debug"                   # Debug, Info (default) or Error
# timestamp_identifier = "time"
# format = "console"                    # console or json

[loggers.rollingfile]
type = "LogRoller.RollingFileWriter"
filename = "testplain.log"
# sizelimit = 10240000
# nfiles = 5
# assumed_level = "Debug"                 # Debug, Info (default) or Error

[loggers.rollingfiletee]
type = "LogRoller.RollingFileWriterTee"
destination = "testapp"
filename = "testapptee.log"
# sizelimit = 10240000
# nfiles = 5
# assumed_level = "Debug"                 # Debug, Info (default) or Error
```

Check documentation of [LogRoller](https://github.com/tanmaykm/LogRoller.jl) for more details about parameter values.
