local ok, jdtls = pcall(require, "jdtls")
if not ok then
    return
end

local home = os.getenv("HOME")
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if not root_dir or root_dir == "" then
    return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.local/share/jdtls-workspaces/" .. project_name

local mason_path = home .. "/.local/share/nvim/mason/packages/jdtls"
local launcher = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_os = mason_path .. "/config_mac"

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
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
        bundles = {},
    },
}
print("JDTLS workspace: " .. workspace_dir)
jdtls.start_or_attach(config)
