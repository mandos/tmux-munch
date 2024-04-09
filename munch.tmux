#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set_option() {
  local option="$1"
  local default_value="$2"
  local option_value
  option_value=$(tmux show-option -gqv "$option")
  if [ -z "$option_value" ]; then
    tmux set -g "$1" "$default_value"
  fi
}

default_colors() {
  # Based on Dawid Kurek's gruvbox dark medium theme.
  # https://github.com/morhetz/gruvbox
  set_option @munch-base00 "#282828" # bg1
  set_option @munch-base01 "#3c3836" # bg2
  set_option @munch-base02 "#504945" # bg3
  set_option @munch-base03 "#665c54" # bg4
  set_option @munch-base04 "#bdae93" # fg1
  set_option @munch-base05 "#d5c4a1" # fg2
  set_option @munch-base06 "#ebdbb2" # fg3
  set_option @munch-base07 "#fbf1c7" # fg4
  set_option @munch-base08 "#fb4934" # red
  set_option @munch-base09 "#fe8019" # orange
  set_option @munch-base0A "#fabd2f" # yellow
  set_option @munch-base0B "#b8bb26" # green
  set_option @munch-base0C "#8ec07c" # cyan
  set_option @munch-base0D "#83a598" # blue
  set_option @munch-base0E "#d3869b" # purple
  set_option @munch-base0F "#d65d0e" # brown

}

default_options() {
  set_option @munch-theme "$CURRENT_DIR/theme.conf"
}

main() {
  default_colors
  default_options
  tmux source-file "$(tmux show-option -gv @munch-theme)"

  # TODO: move it to theme.conf if possible

  # pane number display
  tmux set-option -g display-panes-active-colour "$(tmux show-option -gv @munch-base06)" #bg1
  tmux set-option -g display-panes-colour "$(tmux show-option -gv @munch-base01)"        #bg1

  # cursor
  tmux set-window-option -g cursor-colour "$(tmux show-option -gv @munch-base05)" #fg2

  # clock
  tmux set-window-option -g clock-mode-colour "$(tmux show-option -gv @munch-base0D)" #blue

  # bell
  tmux set-window-option -g window-status-bell-style bg="$(tmux show-option -gv @munch-base08), \
    fg=$(tmux show-option -gv @munch-base00)" # bg=red, fg=bg
}

main
