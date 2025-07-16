return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "macchiato",
        },
        transparent_background = false,
        show_end_of_buffer = true,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      -- Only call this after the plugin has loaded
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
