# change every my-app word with the name of your app (it's written in the Cargo.toml file as the value of name parameter)

FROM rust:alpine as builder
WORKDIR /build
COPY . .
RUN cargo install --path .
RUN cargo build --release


FROM alpine
WORKDIR /app
COPY --from=builder /build/target/release/my-app .
CMD ["./my-app"]
