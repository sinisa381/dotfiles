return {
  {
    "m4xshen/autoclose.nvim",  -- The plugin name
    lazy = false,              -- Load the plugin immediately or adjust as needed
    config = function()
      require("autoclose").setup({
        -- Optional configuration here, you can leave this empty to use defaults
      })
    end,
  },
}
