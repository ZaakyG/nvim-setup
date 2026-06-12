return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" }, -- ⭐ IMPORTANT
    opts = {
      ensure_installed = { "lua_ls", "pyright", "clangd" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      for _, server in ipairs({ "lua_ls", "pyright", "clangd" }) do
        vim.lsp.enable(server)
      end
    end,
  },
}
