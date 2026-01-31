-- Suppress annoying warnings
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end
  notify(msg, ...)
end

-- Enable cfilter plugin
vim.cmd([[packadd cfilter]])
