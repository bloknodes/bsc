FROM alpine:latest AS builder

ARG BSC_VERSION=1.2.8
ARG BSC_DATA_PATH=/blockchain
ENV BSC_VERSION=$BSC_VERSION
ENV BSC_DATA_PATH=$BSC_DATA_PATH

RUN mkdir /tmp/store
RUN apk --no-cache add wget curl unzip

RUN wget -O bsc "https://github.com/bnb-chain/bsc/releases/download/v${BSC_VERSION}/geth_linux" && \
    cp bsc /tmp/store/bsc && \
    wget https://github.com/bnb-chain/bsc/releases/download/v${BSC_VERSION}/testnet.zip && \
    unzip testnet.zip && \
    cp genesis.json /tmp/store/genesis.json 
    # cp config.toml /tmp/store/config.toml

COPY run.sh /tmp/store/run.sh

FROM busybox:latest
RUN mkdir -p /blockchain/config /blockchain/data
COPY --from=builder /tmp/store/bsc /usr/bin/bsc
COPY --from=builder /tmp/store/genesis.json /blockchain/config/genesis.json
# COPY --from=builder /tmp/store/config.toml /blockchain/config/config.toml
COPY --from=builder /tmp/store/run.sh /usr/bin/run.sh
COPY configs/testnet/config.toml /blockchain/config/config.toml

RUN chmod +x /usr/bin/run.sh /usr/bin/bsc

CMD ["/usr/bin/run.sh"]
