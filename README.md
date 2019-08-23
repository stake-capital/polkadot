# Polkadot Stake Capital
All information related to Polkadot 

# Documentation

https://github.com/paritytech/polkadot

# Tools
Telemetry: https://telemetry.polkadot.io/#/Alexander
Explorer: https://polkadot.js.org/apps/#/explorer

# Install Alexander Testnet

## Install on Unbuntu

Run script: https://github.com/stake-capital/polkadot/blob/master/alexander_install.sh

## Synchronize Alexander chain data

Run: `polkadot --chain alex`

## Delete DB

`/opt/cargo/bin/polkadot purge-chain` 

output: 

```
Are you sure to remove "/home/ubuntu/.local/share/polkadot/chains/alexander/db"? (y/n)y
"/home/ubuntu/.local/share/polkadot/chains/alexander/db" removed.
```

# Install Kusama Testnet

https://guide.kusama.network/en/latest/try/validate/
https://polkadot.js.org/apps/#/explorer

## Debug

### Error during compilation

If error: `proc-macro derive panicked`, execute `rm ./runtime/wasm/Cargo.lock`

### Error during resh sync

If error: DB corrupted: Invalid argument: You have to open all column families.

To fix it, run `polkadot purge-chain`:

output:

```
~/polkadot$ polkadot purge-chain
Are you sure to remove "/home/ubuntu/.local/share/polkadot/chains/alexander/db"? (y/n)y
"/home/ubuntu/.local/share/polkadot/chains/alexander/db" removed. 
```

More info: https://github.com/paritytech/polkadot/issues/349
