For a simple Arch Linux installation, look here: https://github.com/firubi/gigachad-arch-installation

# Dotfiles for GIGACHADS
This is the dotfiles for GIGACHADS.
> ![image](https://github.com/user-attachments/assets/60e00ac2-b601-4472-9271-adcaf0830743)


# Programs
- Distro - Arch
- Shell - bash
- Terminal - alacritty
- WM - KDE
- Screenshot - spectacle
- File manager - dolphin
- Image viewer - gwenview
- Document viewer - okular
- Video player - mpv

![image](https://github.com/user-attachments/assets/2c6f1d64-d543-4bb6-bbae-e62ec0bd76a6)

## Various tips
### Hooks
- Informant - read Arch news (AUR)
- Check for orhpans
- Automatically update systemd-boot
- Recommend reboot after nvidia-driver update
- Recommend reboot after kernel update
- Paccache hook (AUR) 

### Fcitx5
Add in /etc/environment
```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```
### SDDM-refresh-rate
You can do this with Xsetup, but I now use SDDM on Wayland. Follow this wiki here https://wiki.archlinux.org/title/SDDM#Wayland. 

### Anki
After an update, the audio in Anki is low. You need to specify ao=pulse in mpv.conf, and put it in ~/.local/share/Anki2/ so Anki reads it. You may want to add ANKI_WAYLAND=1 as an environmental variable if it behaves weirdly on Wayland. 

### Gamescope settings for CS2 stretched
`gamescope -f -r 240 -S stretch  -W 2560 -H 1440 -w 1920 -h 1440 --force-grab-cursor -- %command% +exec autoexec.cfg`

## Basic maintenance
- `sudo pacman -Syu` - to update
- `sudo pacman -Rns` - to remove package
- `pacman -Qq | wc -l` - to show package count
- `sudo pacman -Rns $(pacman -Qdtq)` - to remove orphans (does also remove some make dependencies for AUR and tkg)
- `paccache -r` - to remove previous versions of packages, but keep the latest 3
- `paccache -ruk0` - to remove previous versions of uninstalled packages

## Personal packages

Check my pkglist.txt file to see all my packages!

Flatpaks:
```
flatpak install org.keepassxc.KeePassXC com.obsproject.Studio com.usebottles.bottles com.github.tchx84.Flatseal info.cemu.Cemu sh.ppy.osu io.github.xiaoyifang.goldendict_ng org.qbittorrent.qBittorrent net.davidotek.pupgui2 org.kde.kdenlive org.yuzu_emu.yuzu it.mijorus.gearlever org.libreoffice.LibreOffice
```
