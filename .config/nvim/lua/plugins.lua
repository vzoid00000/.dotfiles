-- ~/.config/nvim/lua/plugins.lua

-- setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 
        "rose-pine/neovim", name = "rose-pine",
        config = function()
            vim.cmd.colorscheme("rose-pine")       

        end,
            
    }, 
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "asm", "c", "cpp", "css", "html", "java", "javascript", "lua", "python", "vim", "vimdoc", "query"},

                auto_install = true,

                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",      -- ss == selection start
                        node_incremental = "<Leader>si",    -- si == selection increment
                        scope_incremental = "<Leader>sc",   -- sc == selection scope
                        node_decremental = "<Leader>sd",    -- sd == selection decrement
                    
                    },
                },
            })
        end,
    }, 
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({})
            lspconfig.clangd.setup({
                
                -- this line is important for cmake projects to avoid include error and you also
                -- need this line in your CMakeLists.txt to generate the compile_commands.json:
                -- set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
                cmd = { "clangd", "--compile-commands-dir=build" },
            
            })

        end,

    },




})



