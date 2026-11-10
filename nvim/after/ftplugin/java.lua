local ok, jdtls = pcall(require, "jdtls")
if not ok then
    return
end

local home = os.getenv("HOME")
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle" }
local root_dir = vim.fs.root(0, root_markers)

if not root_dir then
    return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.local/share/jdtls-workspaces/" .. project_name

local mason_path = home .. "/.local/share/nvim/mason/packages/jdtls"
local launcher = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_os = mason_path .. "/config_mac"

-- java-debug-adapter (Mason) lets nvim-dap debug Java through jdtls
local debug_jars = vim.fn.glob(
    home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
    true, true)

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", launcher,
        "-configuration", config_os,
        "-data", workspace_dir,
    },
    root_dir = root_dir,
    init_options = {
        bundles = debug_jars,
    },
    on_attach = function()
        if #debug_jars > 0 then
            if _G.UserDapSetup then _G.UserDapSetup() end -- see plugin/dap.lua
            -- Registers a "Debug (Attach)" config and one launch config per
            -- main class, so <leader>dc offers "Launch <YourClass>".
            jdtls.setup_dap({ hotcodereplace = "auto" })
            require("jdtls.dap").setup_dap_main_class_configs()
        end
    end,
}
jdtls.start_or_attach(config)
