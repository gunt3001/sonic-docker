# Stage 1: Build the binary
FROM debian:12 AS build

# Install necessary packages
RUN apt-get update && \
    apt-get install -y gcc make git

ARG COMMIT_HASH=8694c596378c24e340c09ff2cd47c065494233f1

# Clone the repository and checkout the specific commit
RUN git clone https://github.com/waywardgeek/sonic.git && \
    cd sonic && \
    git checkout ${COMMIT_HASH} && \
    make sonic

# Stage 2: Create the final image
FROM alpine:latest

# Add glibc compatibility layer package
RUN apk add libc6-compat

# Copy the binary from the build stage
COPY --from=build  /sonic/sonic /usr/local/bin/sonic

# Set the binary as the entrypoint
ENTRYPOINT ["/usr/local/bin/sonic"]

