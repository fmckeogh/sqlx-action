FROM rust AS build
ARG version=0.2.0
RUN cargo install sqlx-cli --version $version

FROM buildpack-deps:buster
WORKDIR /build
COPY --from=build /usr/local/cargo/bin/sqlx /
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
