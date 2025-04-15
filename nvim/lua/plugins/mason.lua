return {
    url = "https://github.com/williamboman/mason.nvim.git",
    name = 'mason.nvim',
    config = function()
        require("mason").setup()
    end
}
