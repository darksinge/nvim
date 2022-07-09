local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
local utils = require "null-ls.utils"
null_ls.setup {
  debug = false,
  sources = {
    -- formatting.prettier.with {
    --   prefer_local = "node_modules/.bin",
    --   root_dir = utils.root_pattern(".null-ls-root", "Makefile", ".git"),
    -- },
    formatting.prettierd.with {
      prefer_local = "node_modules/.bin",
      root_dir = utils.root_pattern(".null-ls-root", "Makefile", ".git"),
    },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    formatting.google_java_format,
    diagnostics.eslint.with {
      only_local = "node_modules/.bin",
    },
    code_actions.eslint,

    -- diagnostics.standardjs,
    -- formatting.standardjs,
  },
}

-- local formatters = null_ls.formatters
-- formatters.setup{
--   { command = "black", filetypes = { "python"}},
--   { command = "isort", filetypes = { "python"}},
--
--   -- {
--   --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--   --   command = "prettier",
--   --   ---@usage arguments to pass to the formatter
--   --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--   --   -- extra_args = { "--print-with", "100" },
--   --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--   --   filetypes = { "typescript", "typescriptreact", "javascript" },
--   --   prefer_local = "node_modules/.bin",
--   -- },
--
--   {
--     exe = "prettierd",
--     filetypes = { "typescript", "javascript", "typescriptreact", "vue" },
--     prefer_local = "node_modules/.bin",
--   },
--
--   {
--     command = "standardjs",
--     filetypes = { "javascript" },
--     only_local = "node_modules/.bin",
--   },
--
-- }

-- -- -- set additional linters
-- local linters = null_ls.linters
-- linters.setup {
--   -- { command = "flake8", filetypes = { "python" } },
--
--   -- {
--   --   -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--   --   command = "shellcheck",
--   --   ---@usage arguments to pass to the formatter
--   --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--   --   extra_args = { "--severity", "warning" },
--   -- },
--   -- {
--   --   command = "codespell",
--   --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--   --   filetypes = { "javascript", "python" },
--   -- },
--
--   {
--     command = "eslint",
--     filetypes = { "javascript", "typescript", "vue" },
--     only_local = "node_modules/.bin",
--   },
--
--   -- {
--   --   command = "standardjs",
--   --   filetypes = { "javascript" },
--   --   only_local = "node_modules/.bin",
--   -- },
--
--   -- { command = "tsserver", filetypes = { "typescript", "typescriptreact" } }
-- }
--
-- -- local code_actions = require('lvim.lsp.null-ls.code_actions')
-- -- code_actions.setup({
-- --   {
-- --     command = "tsserver",
-- --     filetypes = { "typescript", "typescriptreact" }
-- --   }
-- -- })
