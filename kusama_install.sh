#!/bin/bash

# Upgrade the system and install rust
sudo apt update
sudo apt upgrade -y
curl https://sh.rustup.rs -sSf | sh
rustup update
sudo apt install make clang pkg-config libssl-dev build-essential

