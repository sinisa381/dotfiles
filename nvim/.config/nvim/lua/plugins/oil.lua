return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,  -- Enable showing hidden files
      },
    })

    vim.keymap.set("n", "-", oil.toggle_float, {})
  end,
}

