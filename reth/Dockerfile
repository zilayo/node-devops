FROM ubuntu:22.04

RUN apt-get update && apt install build-essential git clang gcc curl pkg-config libssl-dev -y
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Clone and build op-reth
RUN git clone https://github.com/zilayo/reth
RUN cd reth && git checkout zil/opreth && \
  rm -rf Cargo.lock && \
  cargo build --profile release --locked --bin op-reth --features "optimism,jemalloc,asm-keccak" && \
  mv ./target/release/op-reth /usr/local/bin

# Copy entrypoint + jwt
COPY ./reth/reth.sh .
RUN chmod +x reth.sh
COPY jwttoken/jwt.hex .

ENTRYPOINT ["./reth.sh"]