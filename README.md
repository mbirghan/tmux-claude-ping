# tmux-attention

Track tmux panes that need input. Add a pane from a CLI, list/jump with an fzf
popup, and auto-clear entries when you visit them. Inspired by
`tmux-harpoon/harpoon`.

## Requirements

- tmux
- fzf (only required for `list`)

## Install

### TPM

Add to your `.tmux.conf`:

```tmux
set -g @plugin 'yourname/tmux-attention'
run '~/.tmux/plugins/tpm/tpm'
```

### Manual

Clone the repo and source the plugin:

```tmux
run-shell /path/to/tmux-attention/tmux-attention.tmux
```

Install the CLI to your PATH:

```sh
./scripts/install.sh
# or
INSTALL_PATH=$HOME/.local/bin ./scripts/install.sh
```

## Usage (CLI)

```sh
tmux-attention add
tmux-attention list
tmux-attention jump-first
tmux-attention clear-current
tmux-attention status
```

`add` is the default command:

```sh
tmux-attention
```

`add` skips adding the pane if it is currently focused. Use `--test` to
force-add:

```sh
tmux-attention add --test
```

## Suggested keybindings

No default keybindings are installed. Bind what you need:

```tmux
bind-key -n M-a run-shell "tmux-attention add"
bind-key -n M-l run-shell "tmux-attention list"
bind-key -n M-j run-shell "tmux-attention jump-first"
```

## How it works

- Stores entries in `$XDG_CACHE_HOME/tmux-attention`. On macOS, defaults to
  `$HOME/Library/Caches/tmux-attention` and on Linux to
  `$HOME/.cache/tmux-attention`.
- Each entry is `session_name=session_path:window_index.pane_index`.
- `pane-focus-in` hook clears the current entry when you visit a pane.
- `status` prints the next session name plus `window.pane`, with a `+N` suffix
  when more entries exist.
