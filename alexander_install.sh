#!/bin/bash
# Network: Alexander  
# Documentation https://wiki.polkadot.network/en/latest/polkadot/node/guides/how-to-validate/
# Created by: Stake Capital 

# Upgrade the system and install rust
sudo apt update
sudo apt upgrade -y
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
sudo mkdir -p /opt/cargo/bin
rustup update
sudo apt install make clang pkg-config libssl-dev build-essential

# Create a system user for running the service
sudo useradd -m -d /opt/polkadot --system --shell /usr/sbin/nologin polkadot
sudo -u polkadot mkdir -p /opt/polkadot/config

# Install Polkadot
git clone https://github.com/paritytech/polkadot.git
# To update your node. Run from this step.
cd polkadot
cargo clean
git checkout v0.4
git pull origin v0.4
./scripts/init.sh
# Build client. If you get `proc-macro derive panicked`, execute "rm ./runtime/wasm/Cargo.lock"
./scripts/build.sh
cargo install --path ./ --force

# Copy the binaries to /opt/go/bin/
sudo cp $HOME/.cargo/bin/polkadot* /opt/cargo/bin/

# Create systemd unit file
echo "[Unit]
Description=Polkadot Validator
After=network-online.target
[Service]
User=polkadot
ExecStart=/opt/cargo/bin/polkadot --chain alex
Restart=always
RestartSec=3
LimitNOFILE=4096
[Install]
WantedBy=multi-user.target" > polkadot.service

sudo mv polkadot.service /etc/systemd/system/
sudo systemctl enable polkadot.service

# Output logs 
journalctl -u polkadot.service -f
