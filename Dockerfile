FROM rustlang/rust:nightly-slim AS builder

WORKDIR /usr/src/app

# Install build dependencies for openssl-sys
RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    build-essential \
    ca-certificates \
    curl \
    perl \
    && rm -rf /var/lib/apt/lists/*

# Copy manifest and create dummy src to fetch deps
COPY Cargo.toml ./
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo fetch

# Copy full source
COPY . .

# Build the named binary explicitly
RUN cargo build --release --bin leptos-test

# Use slim final image

# Final stage
FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /usr/src/app/target/release/leptos-test .

CMD ["./leptos-test"]


