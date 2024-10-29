# Start with the official Golang image
FROM docker.io/golang:1.23

# Set environment variables
ENV GOPATH=/go
ENV GO111MODULE=on

# Create necessary directories
RUN mkdir -p $GOPATH/src/github.com/aquasecurity

# Change working directory
WORKDIR $GOPATH/src/github.com/aquasecurity

# Copy the local Trivy source code into the container
COPY . /go/src/github.com/aquasecurity/trivy

# Change to the Trivy command directory
WORKDIR /go/src/github.com/aquasecurity/trivy/cmd/trivy

# Install Trivy
RUN go install

# Set the entry point (optional, depending on how you plan to use the image)
ENTRYPOINT ["trivy"]

# Optionally expose ports or volumes if necessary
# EXPOSE <port>
# VOLUME <volume>

# This Dockerfile assumes that your current directory contains the Trivy source code
