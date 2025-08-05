#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "gupdate requires root privileges. Running with sudo..."
    sudo "$0" "$@"
    exit $?
fi

GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"
BOLD="\e[1m"


ascii_banner() {
  echo -e "${GREEN}${BOLD}"
  cat << "EOF"
  _____               __       __
 / ___/__ __ ___  ___/ /___ _ / /_ ___
/ (_ // // // _ \/ _  // _ `// __// -_)
\___/ \_,_// .__/\_,_/ \_,_/ \__/ \__/
          /_/
  Gentoo System Updater - gupdate
  Version: 1.0
  https://gitlab.com/qubixq/gupdate/
EOF
  echo -e "${RESET}"
}

section() {
  echo -e "\n${BOLD}${CYAN}==> $1${RESET}"
}

run_cmd() {
  echo -e "${YELLOW}$ $1${RESET}"
  eval "$1"
}

clear
ascii_banner
echo -e "${GREEN}${BOLD}Gentoo System Updater Starting...${RESET}"

section "1. Overlay Synchronization (emaint)"
run_cmd "emaint -a sync"

section "2. System Update (emerge -avuDN @world)"
run_cmd "emerge -avuDN @world"

section "3. Remove Unneeded Packages (emerge -c)"
run_cmd "emerge -c"

section "4. Clean Distfiles (eclean-dist -d)"
run_cmd "eclean-dist -d"

section "5. Clean Old Packages (eclean-pkg -d)"
run_cmd "eclean-pkg -d"

echo -e "\n${GREEN}${BOLD}✔ Update Completed Successfully!${RESET}"
