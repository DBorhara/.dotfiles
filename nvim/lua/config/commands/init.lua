-- lua/config/commands/init.lua
local command_dir = vim.fn.stdpath("config") .. "/lua/config/commands"

for _, file in ipairs(vim.fn.readdir(command_dir)) do
  if file:match("%.lua$") and file ~= "init.lua" then
    local module = "config.commands." .. file:gsub("%.lua$", "")
    local ok, err = pcall(require, module)
    if not ok then
      vim.notify("Error loading command: " .. module .. "\n\n" .. err, vim.log.levels.ERROR)
    end
  end
end

