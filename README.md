# LogRollerCompose

[![Build Status](https://github.com/tanmaykm/LogRollerCompose.jl/workflows/CI/badge.svg)](https://github.com/tanmaykm/LogRollerCompose.jl/actions/?query=workflow%3ACI+branch%3Amaster)
[![codecov.io](http://codecov.io/github/tanmaykm/LogRollerCompose.jl/coverage.svg?branch=master)](http://codecov.io/github/tanmaykm/LogRollerCompose.jl?branch=master)

Provides plugins to allow logger provided by [LogRoller](https://github.com/tanmaykm/LogRoller.jl) to be used with [LogCompose](https://github.com/tanmaykm/LogCompose.jl).

The following logger types can be composed with this package:
- LogRoller.RollingLogger
- LogRoller.RollingFileWriter

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
```

Check documentation of [LogRoller](https://github.com/tanmaykm/LogRoller.jl) for more details about parameter values.
