
# Normal:
FROM rust:1.70.0-slim-bullseye AS build
ARG APP_NAME=devopsvn

WORKDIR /build

COPY Cargo.lock Cargo.toml ./
RUN mkdir src \
    && echo "// dummy file" > src/lib.rs \
    && cargo build --release

COPY src src
RUN cargo build --locked --release
RUN cp ./target/release/$APP_NAME /bin/server

FROM debian:bullseye-slim AS final
COPY --from=build /bin/server /bin/
ENV ROCKET_ADDRESS=0.0.0.0
CMD ["/bin/server"]

# non-privileged user:
FROM rust:1.70.0-slim-bullseye AS build
ARG APP_NAME=devopsvn

WORKDIR /build

COPY Cargo.lock Cargo.toml ./
RUN mkdir src \
    && echo "// dummy file" > src/lib.rs \
    && cargo build --release

COPY src src
RUN cargo build --locked --release
RUN cp ./target/release/$APP_NAME /bin/server

FROM debian:bullseye-slim AS final

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "10001" \
    appuser
USER appuser

COPY --from=build /bin/server /bin/
ENV ROCKET_ADDRESS=0.0.0.0
CMD ["/bin/server"]
