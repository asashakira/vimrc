return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      defaults = {
        formatter = "path.filename_first",
        -- formatter = "path.dirname_first",
      },
      winopts = {
        width = 0.9,
        height = 0.9,
        preview = {
          -- layout = "flex",
          layout = "vertical",
        },
      },
    },
  },
}
