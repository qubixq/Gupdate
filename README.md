
# Gentoo Update Bash Script
![GUpdate](https://github.com/qubixq/Gupdate/blob/main/banner-logo.png?raw=true)

A **simple**, interactive system updater *for Gentoo Linux users* — written in Bash.

## Installation


### Simple Installation method for system-wide usage (recommended)

```bash
git clone https://github.com/qubixq/Gupdate.git && cd Gupdate && chmod +x gupdate.sh && sudo cp gupdate.sh /usr/local/bin/gupdate && rm -rf ../Gupdate && cd ../
```

> Now the installation is over. You can start it anytime with the `gupdate`
> command.

### Run method without installing

```bash
git clone https://gitlab.com/qubixq/gupdate.git
cd gupdate
chmod +x gupdate.sh
./gupdate.sh
```

## Uninstallation
```bash
sudo rm -f /usr/local/bin/gupdate
```
