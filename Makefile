BINARY_NAME=myapp
DOCKER_IMAGE=e10docker/$(BINARY_NAME):latest

.PHONY: all build docker-run clean

# Default target: build and run tests
all: run

run:
	@echo "Running tests..."
	go run main.go

# Build the Go binary (optional: you might skip this if relying on Docker multi-stage builds)
build:
	@echo "Building Go binary..."
	go build -o $(BINARY_NAME)

# Build the Docker image using the Dockerfile
docker-build:
	@echo "Building Docker image..."
	docker build -t $(DOCKER_IMAGE) .

# Run the Docker container
docker-run:
	@echo "Running Docker container..."
	docker run -it --rm $(DOCKER_IMAGE)

docker-push:
	@echo "Pushing Docker image..."
	docker push $(DOCKER_IMAGE)

# Clean up the built binary
clean:
	@echo "Cleaning up..."
	rm -f $(BINARY_NAME)