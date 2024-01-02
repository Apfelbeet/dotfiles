return {
  { "nvim-lua/plenary.nvim" },
  { "moll/vim-bbye",          lazy = false },
  { "stevearc/dressing.nvim", lazy = false },


  {
    "echasnovski/mini.surround",
    version = false,
    keys = { "sa", "sd", "sf", "sF", "sh", "sr", "sn" },
    config = function()
      require('mini.surround').setup()
    end
  },

  {
    "echasnovski/mini.trailspace",
    version = false,
    lazy = false,
    config = function()
      require('mini.trailspace').setup()
    end
  },

  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>m", '<cmd>lua require("harpoon.mark").add_file()<cr>',        desc = "Harpoon mark" },
      { "<leader>l", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Harpoon list" },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  }
}
