# Minigalaxy Arch repository

This contains an Arch Linux repository for the Minigalaxy AUR package. It is fully hosted on Github.

**This comes with no guarantee that it will even work, since this is just an experiment!**

The repo can be added to your pacman.conf by adding the following lines to it:

```
[minigalaxy]
SigLevel = Optional TrustAll
Server = https://github.com/sharkwouter/arch-repo-test/releases/latest/download/
```

Then Minigalaxy can be installed with the following command:

```
sudo pacman -Sy minigalaxy
```
