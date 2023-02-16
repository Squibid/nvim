require('notify').setup(
  {
    icons = {
      DEBUG = "B",
      ERROR = "x",
      INFO = "i",
      TRACE = "t",
      WARN = "!"
    },
    minimum_width = 35,
    max_width = 80,
    render = "compact",
  }
)
