-- Treesitter: Syntax Highlighting & Parsing
--
-- Provides parser installation. Highlighting and indentation use Neovim's
-- built-in treesitter integration (0.12+).
--
-- Incremental selection: use visual mode `an` (expand) / `in` (shrink)

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = function()
    require("nvim-treesitter").install({
      "json", "javascript", "jinja", "typescript", "tsx", "yaml", "html",
      "css", "prisma", "python", "markdown", "markdown_inline", "svelte",
      "graphql", "bash", "lua", "vim", "dockerfile", "gitignore", "query",
      "vimdoc", "c", "htmldjango",
    })
  end,
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        -- Skip CSV (handled by rainbow_csv)
        if args.match == "csv" then return end

        local ok = pcall(vim.treesitter.start, args.buf)
        if ok then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
