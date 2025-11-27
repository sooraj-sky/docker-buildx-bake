# Docker Buildx Bake Demo

This project demonstrates how to use `docker buildx bake` with HCL configuration to manage multiple services efficiently.

## Project Structure

The project consists of 5 separate services, each with its own Dockerfile, managed by a single `docker-bake.hcl` configuration file.

```
.
├── docker-bake.hcl      # Main Bake configuration file
├── service-a/           # Service A directory
│   └── Dockerfile
├── service-b/           # Service B directory
│   └── Dockerfile
├── service-c/           # Service C directory
│   └── Dockerfile
├── service-d/           # Service D directory
│   └── Dockerfile
└── service-e/           # Service E directory
    └── Dockerfile
```

## Prerequisites

- Docker Desktop or Docker Engine installed.
- Docker Buildx plugin (included in standard Docker Desktop installations).

## Usage

### 1. Inspect Configuration

Before building, you can inspect the resolved configuration to see exactly what Docker will do. This is useful for debugging HCL inheritance and variables.

```bash
docker buildx bake --print
```

### 2. Build All Services

The `docker-bake.hcl` defines a `default` group that includes all 5 services. To build everything in parallel:

```bash
docker buildx bake
```

### 3. Build a Specific Service

You can build individual targets by specifying their name. For example, to build only `service-a`:

```bash
docker buildx bake service-a
```

## Configuration Explained

The configuration is written in **HCL (HashiCorp Configuration Language)**, which offers a structured way to define build targets.

### Groups
Groups allow you to define collections of targets to build together.

```hcl
group "default" {
  targets = ["service-a", "service-b", "service-c", "service-d", "service-e"]
}
```

### Targets
Targets define the build instructions for a specific image.

```hcl
target "service-a" {
  context = "service-a"      # Build context directory
  dockerfile = "Dockerfile"  # Path to Dockerfile relative to context
  tags = ["service-a:latest"] # Image tags
}
```
