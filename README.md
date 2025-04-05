# Simple VertexAI Workbench Container

A simple Hello World container for use with Google Cloud VertexAI Workbench.

## Project Structure

```
.
├── Dockerfile                # Docker configuration for building the container
└── .github/workflows/        # GitHub Actions workflows
    └── docker-build.yml      # Workflow to build and push Docker image
```

## Building Locally

To build the Docker image locally:

```bash
docker build -t vertexai-workbench:latest .
```

To run the container:

```bash
docker run vertexai-workbench:latest
```

## GitHub Actions

This repository includes a GitHub Actions workflow that:

1. Builds the Docker image
2. Pushes it to GitHub Container Registry (when pushed to main branch)
3. Tags the image with the git SHA, branch name, and 'latest'

To use the GitHub Container Registry, ensure you have:
1. Enabled GitHub Container Registry for your account/organization
2. Set appropriate permissions for the repository

## Using with VertexAI Workbench

This container can be used as a custom container for Google Cloud VertexAI Workbench instances.
