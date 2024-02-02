FROM --platform=$BUILDPLATFORM debian:bullseye-slim as base
RUN apt-get update && apt-get install -y libudev-dev build-essential ca-certificates clang curl git libpq-dev libssl-dev pkg-config lsof lld ggc
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Clone and build op-reth
FROM base as build
RUN git clone https://github.com/zilayo/reth
RUN cd reth && git checkout zil/opreth && \
  cargo build --profile release --locked --bin op-reth --features "optimism,jemalloc,asm-keccak" && \
  cp ./target/release/op-reth /reth/op-reth

FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y libssl-dev ca-certificates curl lsof && rm -rf /var/lib/apt/lists/*
COPY --from=build /reth/op-reth /usr/local/bin
COPY ./reth/reth.sh .
RUN chmod +x reth.sh
COPY jwttoken/jwt.hex .

ENTRYPOINT ["./reth.sh"]