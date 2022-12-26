# My dotfiles 🖤

My minmial `i3-gaps` config which I daily drive.  
  
These dotfiles are managed using [Dotbot](https://github.com/anishathalye/dotbot)

## Previews


![Screenshot_2022-12-26-19-00-31_1920x1080](https://user-images.githubusercontent.com/84301852/209554163-78811273-6cab-4f20-9524-c7e7889f445b.png)


![Screenshot_2022-12-26-18-59-05_1920x1080](https://user-images.githubusercontent.com/84301852/209554166-c5cce4ce-ea2b-42b1-86c7-f050a7c443b4.png)


## Quick Setup

1. Manual setup :

- Install the needed tools
```bash
paru -S i3-gaps \
polybar\
rofi\
nitrogen\
picom\
betterlockscreen\
zscroll\
nm-applet\
playerctl\
maim\
xrandr\
dunst\
xclip
```

- Setup the symlinks  
```bash
git clone https://github.com/devadathanmb/dotfiles.git
cd dotfiles
./install
```

2. Quick setup (For fresh arch or arch based installs only):
```bash
cd scripts
./setup.sh
```
