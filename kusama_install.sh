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

# Build release 
cargo build --release

# copy release to /opt/cargo/bin/
sudo cp -R ./target/release/polkadot /opt/cargo/bin/

# Create Systemd service
echo "[Unit]
Description=Polkadot Validator
After=network-online.target
[Service]
User=polkadot
ExecStart=/opt/cargo/bin/polkadot --validator --chain kusama --pruning archive --name "👹  STAKE CAPITAL"
Restart=always
RestartSec=3
LimitNOFILE=4096
[Install]
WantedBy=multi-user.target" > polkadot.service

sudo mv polkadot.servicee /etc/systemd/system/
sudo systemctl enable polkadot.service

# Chain saved into
ls /opt/polkadot/.local/share/polkadot/chains/



