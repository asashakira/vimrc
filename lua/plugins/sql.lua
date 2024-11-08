-- sqlfuff config
-- you will need a config file at the root of project
-- https://docs.sqlfluff.com/en/latest/configuration/setting_configuration.html
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        sqlfluff = {
          args = {
            "lint",
            "--format=json",
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters.sqlfluff = {
        args = { "fix", "-" },
      }
    end,
  },
}
