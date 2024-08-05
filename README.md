# Storj Uplink CLI Docker Container

This repository provides a Docker container for the Storj Uplink CLI, allowing you to interact with the Storj network using the Uplink command-line interface.

## Prerequisites

- Docker installed on your machine.

## Building the Docker Image

To build the Docker image, run the following command:

```sh
docker build --build-arg TARGETARCH=$(uname -m) -t storj-uplink-cli:latest .
```

This command will build the Docker image for the appropriate architecture (amd64, arm, or arm64).

## Running the Docker Container
To run the Docker container and interact with the Storj Uplink CLI, use the following command format:

## Examples
Check Uplink Version
To check the version of the Uplink CLI, run:
```sh
docker run --rm storj-uplink-cli:latest version
```

Other Uplink CLI commands can be run in a similar manner. All the commands can be found here: https://storj.dev/dcs/api/uplink-cli