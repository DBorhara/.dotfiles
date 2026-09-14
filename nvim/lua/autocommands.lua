local group = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- 1. Highlight text after yanking/copying
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- 2. Return to last cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  desc = "Restore cursor position",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- 3. Create missing parent directories before saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  desc = "Create parent directories before saving",
  callback = function(event)
    local file = event.match

    if file:match("^%w%w+://") then
      return
    end

    local dir = vim.fn.fnamemodify(file, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- 4. Remove trailing whitespace before saving
-- Comment this out if you do not like automatic edits.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  desc = "Trim trailing whitespace",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function()
      vim.cmd([[%s/\s\+$//e]])
    end)
    vim.fn.setpos(".", save_cursor)
  end,
})

-- 5. Filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "lua", "ocaml" },
  desc = "Use 2 spaces for Lua and OCaml",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- 6. Markdown/writing settings
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "markdown", "text", "gitcommit" },
  desc = "Enable writing helpers",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
  end,
})

-- 7. Terminal behavior
vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  desc = "Terminal settings",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- 8. Close helper windows with q
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = {
    "help",
    "man",
    "qf",
    "query",
    "checkhealth",
  },
  desc = "Close helper windows with q",
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>close<CR>", {
      buffer = event.buf,
      silent = true,
      desc = "Close window",
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "racket", "scheme" },
  callback = function()
    vim.opt_local.conceallevel = 2

    vim.fn.matchadd(
      "Conceal",
      [[\<lambda\>]],
      10,
      -1,
      { conceal = "λ" }
    )
  end,
})
