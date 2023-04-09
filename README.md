### Thanks for Visiting!
Welcome to my GitHub repository of personal dotfiles! These are syndrizzle dotfiles improved and updated for PikaOS instead of Arch
#### 2. ✨ The Bedazzle BSPWM ✨

### About:
* **Kitty** as the terminal.
* **Tokyo Night** as the color scheme.
* **BSPWM** as the window manager.
* **Picom (Fluffy Animations)** as the compositor.
* **EWW** as the widgets [Dashboard, Player and System Menu]
* **Rofi** as the application launcher.
* **SLiM** as the Display Manager.
* **Dunst** as the notification daemon.
* **Conky** as the desktop eyecandy.
* **Polybar** as the main bar.

⚠️ **NOTE!!!!!** This configuration was made for my PC, so some things might not work on your PC as this was never intended to be a usable full fledged system, in that case, please try if you can fix that up as much as possible, or you can open an issue for help :) This was made for a **1920x1080** screen and on a **Laptop** with **96** dpi.

---
## Installation:
Below are the installation steps to install the dotfiles of my setup. Click on a step to Expand it.
<details>
<summary><b>1. Install Dependencies: </b></summary>

Before we begin the installation, you need to create a `Downloads` folder in your `/home` folder if it is not there by default.
```bash
mkdir ~/Downloads
```
Since we will store temporary cloned files in this folder.

For now the installation instructions are only provided for PikaOS, I have not included the steps for others because I don't want to end up fighting with the compatibility issues on other distributions, I will add them after proper testing.<br>

A one time command to install most of these dependencies with apt is given below, however some of them might need to be installed manually. In this case we are using paru, you can any other, I don't mind 🙃
```bash
sudo apt install cmake build-essential mailutils gnome-terminal polybar rofi bspwm xdg-user-dirs nautilus xorg \
pavucontrol blueman xfce4-power-manager feh lxappearance papirus-icon-theme file-roller neofetch \
imagemagick parcellite xclip maim gpick curl jq tint2 zsh moreutils recode dunst plank python3-xdg python-is-python3 \
redshift mate-polkit xfce4-settings mpv fish alsa-utils slim brightnessctl \
acpi mugshot playerctl wmctrl i3lock jgmenu  \
conky libpulse-dev libobs-dev \
lsof libxdo3 xdotool bluez libev-dev libasound2-dev  libwebkit2gtk-4.0-dev libglfw3 fonts-inter
```

compile the following or install the following projects
```
https://github.com/Raymo111/i3lock-color
```
```
https://github.com/phenax/bsp-layout
```
```
https://github.com/noctuid/zscroll
```
```
noise-suppression-for-voice
```
```
https://starship.rs/
```
```
https://github.com/firecat53/networkmanager-dmenu
```
```
https://github.com/pop-os/system76-power
```
or Download
```
https://launchpad.net/~system76-dev/+archive/ubuntu/pre-stable/+sourcepub/14419274/+listing-archive-extra
```
```
https://github.com/jarcode-foss/glava
```
```
https://github.com/elkowar/eww.git
```
```
https://github.com/baskerville/xqp.git
```
```
https://github.com/pijulius/picom.git
```

You also need `pylrc` which is a python module for handling the lyrics of song in the eww based player. You can skip this if you don't use spotify.
First install `pip`:
```bash
sudo apt install python3-pip
```
Then:
```bash
pip install pylrc
pip install pytz
```
To install pylrc to your main `site-packages` folder.

Add your user to the ADM Group and start the following services:
```bash
sudo usermod -aG adm $USER
```

Start the system76-power service:
```bash
sudo systemctl enable --now com.system76.PowerDaemon
```

Bluetooth:
```bash
sudo systemctl enable bluetooth
```

With that, we have all the dependencies. We can move to the next part.
</details>
<details>
<summary><b>2. Installing GTK Theme:</b></summary>
To match with the current colorscheme, we are using the <a href="https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme">Tokyo Night GTK Theme</a>

```bash
cd ~/Downloads
git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git
cd Tokyo-Night-GTK-Theme/
cp -rvf  themes/Tokyonight-Dark-BL /usr/share/themes/
```
And that's it!
</details>
<details>
<summary><b>3. Installing Dotfiles:</b></summary>
The step we all have been waiting for.

Clone them and install:
```bash
cd ~/Downloads
git clone https://github.com/syndrizzle/hotfiles.git -b bspwm
cd hotfiles
cp -rvf  .config .scripts .local .cache .wallpapers ~/
cp -rvf .xinitrc .gtkrc-2.0 ~/
```
Install Fonts:
Assuming you are already in the `hotfiles` folder
```bash
cd .fonts
cp -rvf * /usr/share/fonts
```
Move `slim.conf` and `environment` to it's location:
Again assuming you are in the `hotfiles` folder
```bash
cd etc/
cp -rvf  slim.conf /etc/
```
Copy items in `usr` folder to their respective places:
```bash
sudo cp -r usr/* /usr/
```
The usr folder contains the cursor theme and some executable scripts.

</details>

## Tips:
### 1. Enable touchpad Tap-to-click:
If you are a laptop user, you might want to enable tap to click so that it gets easier to navigate using a touchpad. It is pretty easy to do so!
Copy and paste this one command in your terminal to fly!

```bash
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF
```

### 2. Enable GitHub Notification count.
If you are a GitHub user, you can get a notification count on your main bar.
For this you will need a **GitHub Personal Access Token** in order to authenticate yourself with the API.
[Follow this guide for obtaining the Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)

Next, you just need to append the token to your polybar script using your preferred text editor, in this case we are using `nano` :
```bash
nano ~/.config/polybar/scripts/github
```
Now, replace `Your_Username` in the `USER` field with your GitHub username.
And then replace `Your_PAT` in the `TOKEN` field with your Personal Access Token.

### 3. Get your directories.
If there are no default directories when you do `dir` or `ls`, you might just have to manually create them.
Just install `xdg-user-dirs` and run the command, then reboot.
```bash
xdg-user-dirs-update
```

### 4. Turn on lock screen when you need it.
Since we are using xfce4-power-manager, we might want to make it toggle the lock screen when the laptop lid is closed, or if the laptop is just idle. To do this we can use `xfconf-query` to set the command that needs to manually toggle our lockscreen,
```bash
xfconf-query -c xfce4-session -p /general/LockCommand -s "$HOME/.scripts/lock-run" --create -t string
```

## Credits:

#### Thanks to:

* [Syndrizzle](https://github.com/Syndrizzle/hotfiles)
---
* **The wallpapers have been taken from [Wallhaven](https://wallhaven.cc), [pexels](https://pexels.com) and the [tokyo night gtk theme  repository](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme/tree/master/wallpapers)**<br>
* **The icons are from [icons8](https://icons8.com), [flaticon](https://flaticon.com), [materialdesignicons](https://materialdesignicons.com), [IcoMoon](https://icomoon.io), [feather-icons](https://feathericons.com/) and [Nerd Fonts](https://www.nerdfonts.com)**<br>
* The Conky theme was taken from [closebox73's Scorpio](https://github.com/closebox73/Scorpio) conky themes pack, named "Auva". It was modified to match the color scheme.


<p align="center"><b>That's it! Have a nice day!</b></p>

