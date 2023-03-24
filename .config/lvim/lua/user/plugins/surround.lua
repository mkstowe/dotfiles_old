return {
  'echasnovski/mini.surround',
  config = function()
    require('mini.surround').setup {
      mappings = {
        add = "gza",
        delete = "gzd",
        find = "gzf",
        find_left = "gzF",
        highlight = "gzh",
        replace = "gzr",
        update_n_lines = "gzn"
      }
    }
  end
}
