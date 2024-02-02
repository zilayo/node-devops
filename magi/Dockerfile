FROM --platform=$BUILDPLATFORM debian:bullseye-slim as base
RUN apt-get update && apt-get install -y libudev-dev build-essential ca-certificates clang curl git libpq-dev libssl-dev pkg-config lsof lld gcc
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Build
FROM base as build
RUN git clone https://github.com/zilayo/magi
RUN cd magi && git checkout zil/mode && \
  cargo build --profile release --locked --bin magi && \
  cp ./target/release/magi /magi/magi

FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y libssl-dev ca-certificates curl lsof && rm -rf /var/lib/apt/lists/*
COPY --from=build /magi/magi /usr/local/bin
COPY ./magi/magi.sh .
COPY ./jwttoken/jwt.hex .

RUN chmod +x magi.sh

ENTRYPOINT ["./magi.sh"]