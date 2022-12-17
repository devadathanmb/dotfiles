# My dotfiles 🏠

My minmial i3-gaps config which I daily drive.
These dotfiles are managed using [Dotbot](https://github.com/anishathalye/dotbot)

## Previews
![Screenshot_2022-12-08-14-48-38_1920x1080](https://user-images.githubusercontent.com/84301852/206455555-16948458-baf4-4033-adc6-2671aa983e46.png)
<br>
![Screenshot_2022-12-08-14-54-05_1920x1080](https://user-images.githubusercontent.com/84301852/206455561-adc798dd-78fd-42bd-8f9d-7b82be948dc7.png)
<br>
![Screenshot_2022-12-08-14-54-32_1920x1080](https://user-images.githubusercontent.com/84301852/206455568-ccb763b2-5b2a-43f6-bf2a-5b076244cbfa.png)
<br>
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
./setup
```

2. Automated setup :

- Clone the repository and run the script
```bash
git clone https://github.com/devadathanmb/dotfiles.git
cd dotfiles && ./setup.sh
```
