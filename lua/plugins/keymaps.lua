return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      local builtin = require("telescope.builtin")

      wk.setup({})

      wk.add({
        -- FILES
        { "<leader>f", group = "Files" },
        { "<leader>ff", builtin.find_files, desc = "Find Files" },
        { "<leader>fg", builtin.live_grep, desc = "Live Grep" },
        { "<leader>fb", builtin.buffers, desc = "Buffers" },
        { "<leader>fh", builtin.help_tags, desc = "Help Tags" },
      })


  },
}
