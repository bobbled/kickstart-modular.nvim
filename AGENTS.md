# AGENTS.md

Agent context for this Neovim config (kickstart-modular.nvim fork).

## Structure

- `init.lua` — entry point; sets leader (`<Space>`) before any `require`
- `lua/options.lua` — vim options (no plugin deps)
- `lua/keymaps.lua` — core keymaps and autocommands (no plugin deps)
- `lua/lazy-bootstrap.lua` — installs lazy.nvim if absent
- `lua/lazy-plugins.lua` — calls `require('lazy').setup()`
- `lua/kickstart/plugins/*.lua` — upstream plugin configs (15 files, treat as base)
- `lua/custom/plugins/` — **user extension point**; any `.lua` file here is auto-imported by lazy.nvim

## Adding plugins

Add new plugin specs to `lua/custom/plugins/init.lua` (or new files in that directory). Do **not** modify `lua/kickstart/plugins/` unless fixing a kickstart-level issue — it creates merge conflicts on upstream pulls.

Each plugin file must return a lazy.nvim spec table:
```lua
---@module 'lazy'
---@type LazySpec
return {
  -- spec here
}
```

## Lua style (enforced by StyLua)

Config: `.stylua.toml`

- `call_parentheses = "None"` — omit parens on single-arg calls: `require 'foo'`, not `require('foo')`
- `indent_type = "Spaces"`, `indent_width = 2`
- `column_width = 160`
- `quote_style = "AutoPreferSingle"`
- End every file with: `-- vim: ts=2 sts=2 sw=2 et`

Run StyLua before committing:
```sh
stylua lua/
```

## nvim-treesitter (main branch)

Pinned to the `main` branch (rewrite, Neovim 0.12+). The old `nvim-treesitter.configs` module is gone.

- `require('nvim-treesitter.configs').setup {}` — **removed**; do not use
- Highlighting and indent are built into Neovim 0.12; no explicit enable needed
- Parser install: `require('nvim-treesitter').install { 'lua', ... }`
- Requires `tree-sitter` CLI in PATH to compile parsers: `npm install -g tree-sitter-cli`

## Key plugins

| Role | Plugin |
|---|---|
| Plugin manager | lazy.nvim (lockfile: `lazy-lock.json`) |
| Completion | blink.cmp (not nvim-cmp) |
| Formatting | conform.nvim |
| Linting | nvim-lint |
| LSP | mason + mason-lspconfig; only `lua_ls` enabled by default |
| Fuzzy find | telescope.nvim + fzf-native |
| File tree | neo-tree.nvim |

`lua_ls` formatting is explicitly disabled in `lspconfig.lua` (`documentFormattingProvider = false`) — conform/StyLua handles Lua formatting.

## LSP keymaps

LSP mappings are set inside `LspAttach` autocommands (in `lspconfig.lua` and `telescope.lua`), not globally.

## Health check

```
:checkhealth kickstart
```

Requires Neovim >= 0.11, and `git`, `make`, `unzip`, `rg` in PATH.

## Lockfile

`lazy-lock.json` is tracked in git — keep it committed.
