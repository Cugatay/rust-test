# FROM alpine:latest
# WORKDIR /app
# COPY . ./
# RUN apk add --no-cache build-base gcc pkgconfig curl file git openssl-dev
# RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
# CMD ["/root/.cargo/bin/cargo run --manifest-path=/app/Cargo.toml --release"]

FROM rust:alpine as builder
WORKDIR /usr/src/myapp
COPY . .
RUN cargo install --path .
 
# FROM debian:buster-slim
# RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
# COPY --from=builder /usr/local/cargo/bin/myapp /usr/local/bin/myapp
# CMD ["myapp"]