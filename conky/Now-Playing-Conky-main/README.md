# Now-Playing-Conky
This is an applet (specifically made for gnome desktop) that displays the current music you're playing on your system. This is inspired from KDE "Now Playing" widget.



# This is how KDE widget looks like
<a href='https://images.pling.com/img/00/00/60/32/81/1480598/1ff855e45e5710cc79d77c95a45a819ea027e3de09e49d49d7a6ab8e795677c0f389.png'><img src ='https://images.pling.com/img/00/00/60/32/81/1480598/1ff855e45e5710cc79d77c95a45a819ea027e3de09e49d49d7a6ab8e795677c0f389.png' width ='70%'> </a>

# And this is how 'Now Playing' Conky looks like
<a href='http://0x0.st/oXDh.png'><img src='http://0x0.st/oXDh.png' width='70%'></a>

# Download Requirements
``` 
sudo apt install conky conky-all
```

# Setting Up
``` 
git clone https://github.com/thewickedkarma/Now-Playing-Conky.git
cd Now-Playing-Conky
chmod +x *
mv * ~/.conky
conky -c ~/.conky/nowplaying &

```
# Run at startup

```
sh "~/.conky/conky-startup.sh"
# you can put this command in the startup applications
```

<a href='http://0x0.st/oXk-.png' ><img src='http://0x0.st/oXk-.png' width='70%'></a>

## If you prefer GUI over CLI for the customization and all, then you should download conky-manager:
``` sudo apt install conky-manager```

<a href='http://0x0.st/oXki.png' > <img src='http://0x0.st/oXki.png' width= '70%' ></a>
