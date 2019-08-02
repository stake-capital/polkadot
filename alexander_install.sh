#!/bin/bash
# Network: Alexander  
# Documentation https://wiki.polkadot.network/en/latest/polkadot/node/guides/how-to-validate/
# Created by: Stake Capital 

# Upgrade the system and install rust
sudo apt update
sudo apt upgrade -y
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup update
sudo apt install make clang pkg-config libssl-dev build-essential

# Install Polkadot
git clone https://github.com/paritytech/polkadot.git
# To update your node. Run from this step.
cd polkadot
cargo clean
git checkout v0.4
git pull origin v0.4
./scripts/init.sh
./scripts/build.sh
cargo install --path ./ --force
