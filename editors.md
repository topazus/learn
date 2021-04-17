# kite

```
bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
```

```
This script will install Kite!

We hope you enjoy! If you run into any issues, please report them at https://github.com/kiteco/issue-tracker.

- The Kite Team

Press enter to continue...

Checking to see if all dependencies are installed....

Downloading /home/ruby/kite-installer binary using wget...
Running /home/ruby/kite-installer install
[installer] no previous kite installation found
[installer] latest version is 2.20210310.0, downloading now...
[installer] Downloading Kite:   99.9% of 485 MiB
[installer] verifying checksum
[installer] validating signature
[installer] installing version 2.20210310.0
[installer] installed ~/.config/autostart/kite-autostart.desktop
[installer] installed ~/.config/systemd/user/kite-autostart.service
[installer] installed ~/.config/systemd/user/kite-updater.service
[installer] installed ~/.config/systemd/user/kite-updater.timer
[installer] installed ~/.local/share/applications/kite-copilot.desktop
[installer] installed ~/.local/share/applications/kite.desktop
[installer] installed ~/.local/share/icons/hicolor/128x128/apps/kite.png
[installer] installed ~/.local/share/kite/kited
[installer] installed ~/.local/share/kite/login-user
[installer] installed ~/.local/share/kite/logout-user
[installer] installed ~/.local/share/kite/uninstall
[installer] installed ~/.local/share/kite/update
[installer] activating kite-updater systemd service
[installer] activating kite-autostart systemd service
[installer] registering kite:// protocol handler
[installer] kite is installed! launching now! happy coding! :)
[installer] with systemd, run systemctl --user start kite-autostart
[installer] without systemd, run /home/ruby/.local/share/kite/kited
[installer] 	or launch it using the Applications Menu
Removing kite-installer
```