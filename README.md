# guixt490

ThinkPad T490 backup — Debian forky/sid + GNU Guix

## System
- Debian GNU/Linux (forky/sid)
- Intel i5-8365U, 16GB RAM, 1.8TB NVMe
- GNU Guix package manager (foreign distro)

## Desktop
- Xfce 4.20 (base) + EWM (Emacs Wayland Manager)
- Emacs 30.2 + Crafted Emacs + Modus Vivendi Tinted
- Polybar + Dunst + Picom
- Alacritty terminal + JetBrains Mono
- Adwaita-dark + Papirus-Dark icons

## AI Tools
- Claude Code (primary)
- Gemini CLI
- Kiro CLI

## Structure
```
config/          # XDG config files
  emacs/         # Crafted Emacs + Modus Vivendi
  polybar/       # Status bar
  dunst/         # Notifications
  picom/         # Compositor
  alacritty/     # Terminal
  gtk-3.0/       # GTK theme
  guix/          # Guix channels
ewm/             # Emacs Wayland Manager configs
  lisp/          # EWM elisp modules
  etc/           # Shell integration
```

## Install
```bash
# Stow or symlink configs
ln -sf $(pwd)/config/* ~/.config/
```
