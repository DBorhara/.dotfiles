return {
    url = 'https://github.com/mfussenegger/nvim-lint.git',
    name = "nvim-lint",
    init = function()
        require("lint").linters_by_ft = {
            lua = { "selene" },
            java = { "checkstyle" },
        }
    end
}
