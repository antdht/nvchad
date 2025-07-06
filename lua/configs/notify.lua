local nvim_notify = require "notify"
nvim_notify.setup {
  -- Animation style
  stages = "slide",
  render = "compact",
  fps = 120,
  level = 1,
  -- Default timeout for notifications
  timeout = 1000,
  background_colour = "#888888",
}

vim.notify = nvim_notify
