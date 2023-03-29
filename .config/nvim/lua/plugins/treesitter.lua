require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "help", "ruby", "rust" },

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },
}
