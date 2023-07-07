# bsc
Binance Smart Chain (bsc) on Docker

## Docker

### Testnet

It will detect if the node was initialized, and if not it will do so and then start

```bash
docker run -it --network host -v $PWD/data:/blockchain/data bloknodes/bsc:1.2.8
```

## Standalone

### Testnet

Download the latest binary from the [releases](https://github.com/bnb-chain/bsc/releases):

```bash
wget -o bsc https://github.com/bnb-chain/bsc/releases/download/v1.2.8/geth_linux
chmod +x bsc
```

Download the [testnet.zip](https://github.com/bnb-chain/bsc/releases/download/v1.2.8/testnet.zip) archive:

```bash
wget https://github.com/bnb-chain/bsc/releases/download/v1.2.8/testnet.zip
```

Extract the `genesis.json` and `config.toml` from the archive:

```bash
unzip testnet.zip
```

Initialize:

```bash
mkdir ~/data
bsc --config config.toml --datadir ~/data init genesis.json
```

Start:

```bash
bsc --config config.toml --datadir ~/data
```

## Resources
- [https://github.com/bnb-chain/bsc](https://github.com/bnb-chain/bsc)
