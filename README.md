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

Select the project and open cloud shell.
```
PROJECT_ID=$(gcloud config get-value project)

gcloud services enable aiplatform.googleapis.com
gcloud services enable artifactregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable containerfilesystem.googleapis.com
gcloud services enable containerregistry.googleapis.com

# create artifacts repository
gcloud artifacts repositories create demo --repository-format=docker --location=us --project=$PROJECT_ID

# create build to push image to repostiory
gcloud builds submit --config cloudbuild.yaml --git-source-dir https://github.com/gaplo917/kotlin-vertexai-workbench-container
```
