# Neovim Config

## Plugins

- `lazy` : plugin Manager
- `telescope` : fuzzy finder
- `treesitter` : code parser (syntax highlighting, incremental selection, etc.)
- `lsp-zero`
  + `lspconfig` : lsp
  + `cmp` : automcompletion for lsp - buffer - path - snippets
  + `mason` : installer/manager for lsp - linter - formatter
- `harpoon` : buffer navigation
- `undotree` : vim undo branch visualization and navigation
- `fugitive` : git integration
- `rose-pine` : color scheme

## Setup

Requires Neovim `0.9.x` or later

  `cd ~/.config/`

  `git clone git@github.com:jakepper/neovim-config.git`

  `mv neovim-config nvim`

  `nvim ./nvim`
