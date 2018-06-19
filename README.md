# Dotfiles
Dotfiles are a series of system configuration settings that I use for productivity on my machine. I often switch between machines or use multiple machines so having a consistent experience is critical. I currently use two platforms, `Mac OSX` and `Ubuntu 18.04`. Below are instructions for configuration these environments.

## Mac OSX
To get started with the Mac, review the configuration files. If you are using this repo you will need to update the GPG Key signature.

```bash
# bootstrap a machine from new, runs install, symlink, config
make bootstrap-macosx

# install applications
make install-macosx

# symlink configuration files
make symlink-macosx

# configure osx look and feel
make config-macosx
```

## Ubuntu 18.04
To get started with Ubuntu, review the configuration files. If you are using this repo you will need to update the GPG Key signature.

```bash
# bootstrap a machine from new, runs install and symlink
make bootstrap-ubuntu

# install applications
make install-ubuntu

# symlink configuration files
make symlink-ubuntu
```
