# X startup configurtation

# Setup Monitors
xrandr --output DVI-I-3 --auto --primary
xrandr --output DVI-I-2 --auto --rotate right --right-of DVI-I-3

# Lower Mouse Sensitivity
xinput --set-prop 'Razer Razer DeathAdder' 'Device Accel Constant Deceleration' 1.4

# Whore out the X session to anyone.
xhost +

# Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# Export Env
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

#exec gnome-session
#exec startxfce4
exec awesome
#exec startlxde

