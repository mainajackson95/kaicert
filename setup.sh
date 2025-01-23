#!/bin/bash
# File: install.sh
# Description: Dependency installer for KAICERT

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Required tools
REQUIREMENTS=("curl" "jq")

# Check if package manager exists
install_pkg() {
  if command -v apt-get &> /dev/null; then
    sudo apt-get update && sudo apt-get install -y $1
  elif command -v yum &> /dev/null; then
    sudo yum install -y $1
  elif command -v dnf &> /dev/null; then
    sudo dnf install -y $1
  elif command -v zypper &> /dev/null; then
    sudo zypper install -y $1
  elif command -v brew &> /dev/null; then
    brew install $1
  else
    echo -e "${RED}Error: No supported package manager found!${NC}"
    exit 1
  fi
}

# Check and install dependencies
check_deps() {
  for pkg in "${REQUIREMENTS[@]}"; do
    if ! command -v $pkg &> /dev/null; then
      echo -e "${GREEN}[+] Installing $pkg...${NC}"
      install_pkg $pkg
    else
      echo -e "${GREEN}[+] $pkg already installed${NC}"
    fi
  done
}

# Main installation
echo -e "\n${GREEN}=== KAICERT Dependency Installer ===${NC}"
check_deps

# Clone repository (if not already present)
if [ ! -d "KAICERT" ]; then
  echo -e "\n${GREEN}[+] Cloning KAICERT repository...${NC}"
  git clone https://github.com/yourusername/KAICERT.git
  chmod +x KAICERT/kaicert.sh
fi

echo -e "\n${GREEN}Installation complete! Run:${NC}"
echo "cd KAICERT && ./kaicert.sh"
