# tmux-munch

A customizable theme based on 16 color scheme.

## Why?

I use NixOS and there is an easy way to inject [base16 colors schemes](https://github.com/tinted-theming/schemes) into your configuration (I use [nix-colors](https://github.com/Misterio77/nix-colors)). I decided that I wanted to have consistent colors for the terminal and Tmux.

## How?

Just to set up Tmux's options for every color in the base 16 scheme. Colors should be recognizable by the Tmux colors engine. Default theme is based on (egel's work)[https://github.com/egel/tmux-gruvbox] and color scheme is gruvbox medium dark.

Example (and also these are defaults):
```
  set-option -g @munch-base00 "#282828" # bg1
  set-option -g @munch-base01 "#3c3836" # bg2
  set-option -g @munch-base02 "#504945" # bg3
  set-option -g @munch-base03 "#665c54" # bg4
  set-option -g @munch-base04 "#bdae93" # fg1
  set-option -g @munch-base05 "#d5c4a1" # fg2
  set-option -g @munch-base06 "#ebdbb2" # fg3
  set-option -g @munch-base07 "#fbf1c7" # fg4
  set-option -g @munch-base08 "#fb4934" # red
  set-option -g @munch-base09 "#fe8019" # orange
  set-option -g @munch-base0A "#fabd2f" # yellow
  set-option -g @munch-base0B "#b8bb26" # green
  set-option -g @munch-base0C "#8ec07c" # cyan
  set-option -g @munch-base0D "#83a598" # blue
  set-option -g @munch-base0E "#d3869b" # purple
  set-option -g @munch-base0F "#d65d0e" # brown
```

If you want to customize theme, you can create theme file and set `@munch-theme` option.
```
  set-option -g @munch-theme PATH-TO-THEME-FILE
```

## Installation

### Manually (not recommend)

### Tmux Plugin Manger (better but still not recommended)

### NixOS flakes

It's working

## Development

## License

[MIT License Copyright (c) 2024 Marek Maksimczyk](./LICENSE)
