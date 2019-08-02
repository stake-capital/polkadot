# Polkadot
All information related to polkadot

# Main repo

https://github.com/paritytech/polkadot

# Tools

# Install Alexander Testnet

## Install on Unbuntu

Run script: https://github.com/stake-capital/polkadot/blob/master/alexander_install.sh

## Synchronize Alexander chain data

Run: `polkadot --chain alex`

## Debug

### During fresh sync

If error: DB corrupted: Invalid argument: You have to open all column families.

To fix it, run `polkadot purge-chain`:

output:

```
~/polkadot$ polkadot purge-chain
Are you sure to remove "/home/ubuntu/.local/share/polkadot/chains/alexander/db"? (y/n)y
"/home/ubuntu/.local/share/polkadot/chains/alexander/db" removed. 
```
