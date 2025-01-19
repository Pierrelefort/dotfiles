-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- custom setup init.lua

require("toggleterm").setup({
  direction = "float", -- Floating terminal
})

-- Commitizen commit
vim.keymap.set("n", "<Leader>gzc", function()
  -- Check if there are staged files
  local handle = io.popen("git diff --cached --name-only")
  local staged_files = handle:read("*a")
  handle:close()

  if #staged_files == 0 then
    -- No files staged for commit, show a warning message
    vim.notify(
      "No files staged for commit.\n\nUse 'git add <file>' to stage files.",
      vim.log.levels.WARN,
      { title = "Commitizen Warning" }
    )

    return
  end

  require("toggleterm.terminal").Terminal:new({
    cmd = "cz commit",
    direction = "float",
    close_on_exit = true,
  }):toggle()
end, { noremap = true, silent = true, desc = "Run Commitizen (cz commit)" })

-- end custom setup
