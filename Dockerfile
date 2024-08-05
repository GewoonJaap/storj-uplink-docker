# Use an official Alpine as a parent image
FROM alpine:latest

# Set the working directory
WORKDIR /usr/src/app

# Install dependencies
RUN apk add --no-cache \
    curl \
    unzip \
    sudo

# Define build arguments
ARG TARGETARCH

# Download and install Storj Uplink based on the architecture
RUN if [ "$TARGETARCH" = "amd64" ]; then \
        curl -L https://github.com/storj/storj/releases/latest/download/uplink_linux_amd64.zip -o uplink_linux_amd64.zip && \
        unzip -o uplink_linux_amd64.zip && \
        sudo install uplink /usr/local/bin/uplink && \
        rm uplink_linux_amd64.zip; \
    elif [ "$TARGETARCH" = "arm" ]; then \
        curl -L https://github.com/storj/storj/releases/latest/download/uplink_linux_arm.zip -o uplink_linux_arm.zip && \
        unzip -o uplink_linux_arm.zip && \
        sudo install uplink /usr/local/bin/uplink && \
        rm uplink_linux_arm.zip; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
        curl -L https://github.com/storj/storj/releases/latest/download/uplink_linux_arm64.zip -o uplink_linux_arm64.zip && \
        unzip -o uplink_linux_arm64.zip && \
        sudo install uplink /usr/local/bin/uplink && \
        rm uplink_linux_arm64.zip; \
    else \
        echo "Unsupported architecture"; \
        exit 1; \
    fi

# Set the entrypoint
ENTRYPOINT ["uplink"]