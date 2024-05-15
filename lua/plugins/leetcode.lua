return {

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- telescope 所需
      "MunifTanjim/nui.nvim",

      -- 可选
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- 配置放在这里
      cn = {
        enabled = true,
        translator = false, ---@type boolean
        translate_problems = false, ---@type boolean
      },
      lang = "java",
      description = {
        position = "left", ---@type lc.position

        width = "20%", ---@type lc.size

        show_stats = true, ---@type boolean
      },
    },
  },

  -- leap vim
  {
    "ggandor/leap.nvim",
    lazy = true,
    keys = { "r", "R", "W", "dr", "dR", "yr", "yR", "cr", "cR" },
    config = function()
      require("leap").opts.highlight_unlabeled_phase_one_targets = true
      -- leap.add_default_mappings()
      vim.keymap.set({ "x", "o", "n" }, "r", "<Plug>(leap-forward-to)")
      vim.keymap.set({ "x", "o", "n" }, "R", "<Plug>(leap-backward-to)")
      vim.keymap.set({ "x", "o", "n" }, "W", "<Plug>(leap-from-window)")
    end,
  },

  -- flit vim
  {
    "ggandor/flit.nvim",
    lazy = true,
    keys = { "f", "F", "t", "T" },
    dependencies = { "ggandor/leap.nvim" },
    config = function()
      require("flit").setup({
        keys = { f = "f", F = "F", t = "t", T = "T" },
        labeled_modes = "v",
        multiline = true,
        opts = {},
      })
    end,
  },

  -- goto preview
  -- https://www.bilibili.com/read/cv22495061/
  {
    "rmagatti/goto-preview",
    lazy = true,
    keys = { "gp" },
    config = function()
      require("goto-preview").setup({
        width = 120,
        height = 25,
        default_mappings = true,
        debug = false,
        opacity = nil,
        post_open_hook = nil,
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      })
    end,
  },

  -- lastplace
  {
    "ethanholz/nvim-lastplace",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },

  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
      require("todo-comments").setup()
    end,
  }, -- 作者：adgnn https://www.bilibili.com/read/cv22495061/ 出处：bilibili

  {
    "kylechui/nvim-surround",
    lazy = true,
    keys = { "cs", "ds", "ys" },
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  -- 作者：adgnn https://www.bilibili.com/read/cv22495061/ 出处：bilibili
  {
    "folke/persistence.nvim",
    -- Restore last session of current dir
    lazy = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
        pre_save = nil,
      })
    end,
  }, -- 作者：adgnn https://www.bilibili.com/read/cv22495061/ 出处：bilibili

  {
    "anuvyklack/windows.nvim",
    lazy = true,
    cmd = { "WindowsMaximize", "WindowsMaximizeVertically", "WindowsMaximizeHorizontally", "WindowsEqualize" },
    dependencies = {
      "anuvyklack/middleclass",
    },
    config = function()
      require("windows").setup({
        autowidth = {
          enable = false,
        },
        ignore = {
          buftype = { "quickfix" },
          filetype = {
            "NvimTree",
            "neo-tree",
            "undotree",
            "gundo",
            "qf",
            "toggleterm",
            "TelescopePrompt",
            "alpha",
            "netrw",
          },
        },
      })
    end,
  }, -- 作者：adgnn https://www.bilibili.com/read/cv22495061/ 出处：bilibili
}
