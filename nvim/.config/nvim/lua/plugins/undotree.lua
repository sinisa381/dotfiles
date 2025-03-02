return {
    "mbbill/undotree",

    config = function() 
    local function undotreeToggle()
      vim.cmd.UndotreeToggle()
      vim.cmd.UndotreeFocus()
    end
        vim.keymap.set("n", "<leader>u", undotreeToggle)
    end
}
