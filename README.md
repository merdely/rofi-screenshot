# rofi-screenshot
Rofi Script for using Screenshots using maim

# Prerequisites

* maim
* xclip or wl-clipboard
    * Note: If xclip AND wl-copy are installed, xclip will be used
* rofi
* Optional:
    * libnotify (for notify-send)
    * dunst (or similar for displaying notifications)
    * Image viewer (searched for in this order):
        * nsxiv: https://github.com/nsxiv/nsxiv
        * sxiv: https://github.com/muennich/sxiv
        * feh: https://feh.finalrewind.org/

# TLDR

1. Download the rofi-screenshot script
2. Put it in a directory in your PATH
3. Make it executable (chmod 755 rofi-screenshot)

# User Installation

1. Download the latest release file (1.0 in this example)
2. Extract package: `tar -xvzf rofi-screenshot-1.0.tar.gz`
3. Change to package directory: `cd rofi-screenshot-1.0`
4. Run: `make install-user`
5. Use something like xbindkeys or sxhkd to configure a hot key combination

# System-wide Installation

For advanced users

1. Download and extract a release
2. Run: sudo make install-system

# My xbindkeys example:
```
"rofi-screenshot"
  Print
```
