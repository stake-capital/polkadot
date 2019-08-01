#!/bin/bash
# Kusama Installation 
# Updated documentation https://guide.kusama.network/en/latest/try/validate/#building-and-installing-your-kusama-node
# created by: Stake Capital 

# Upgrade the system and install rust
sudo apt update
sudo apt upgrade -y
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup update
sudo apt install make clang pkg-config libssl-dev build-essential

# Install Polkadot
git clone https://github.com/paritytech/polkadot.git
# To update your node, run from this step.
cd polkadot
cargo clean
./scripts/init.sh
cargo install --path ./ --force
