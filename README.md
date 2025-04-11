## Using with VertexAI Workbench

This container can be used as a custom container for Google Cloud VertexAI Workbench instances.

#### Step 1: Select the project and open Google Cloud Shell

Login [Google Cloud Platform](https://console.cloud.google.com/vertex-ai/workbench/instances).
Select the right project and click to open the Google Cloud Shell as shown below. 

![](assets/step1.png)


#### Step 2: Create Kotlin Jupyter Workbench image

Accept and authorize to use Google Cloud Shell. Copy and paste the follow scripts.

2.1 Enable all the services in Google Cloud

```bash
PROJECT_ID=$(gcloud config get-value project)

gcloud services enable aiplatform.googleapis.com
gcloud services enable artifactregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable containerfilesystem.googleapis.com
gcloud services enable containerregistry.googleapis.com
````

2.2 Create [Artifacts Repository](https://cloud.google.com/artifact-registry/docs/overview) for Kotlin Jupyter container image.

```bash

# create artifacts repository
gcloud artifacts repositories create demo --repository-format=docker --location=us --project=$PROJECT_ID
```

2.3 Create serverless [Cloud build](https://cloud.google.com/build?hl=en) to build the image from this repository `Dockerfile`.

See the [cloudbuild.yaml](cloudbuild.yaml) configuration.
```bash
git clone https://github.com/gaplo917/kotlin-vertexai-workbench-container.git

cd kotlin-vertexai-workbench-container

# create build to push image to repository
gcloud builds submit --config cloudbuild.yaml --git-source-dir https://github.com/gaplgio917/kotlin-vertexai-workbench-container
```

#### Step 3: Create workbench instance

Create Vertex AI workbench instance 
```bash
PROJECT_ID=$(gcloud config get-value project)

gcloud workbench instances create kotlin-workbench-instance \
  --location=us-central1-a \
  --container-repository=us-docker.pkg.dev/$PROJECT_ID/kotlin-demo-repository/kotlin-vertexai-workbench-container \
  --container-tag=latest \
  --machine-type=n2-standard-4 \
  --project=$PROJECT_ID
```


#### Step 4: Go to Vertex AI workbench

https://console.cloud.google.com/vertex-ai/workbench/instances 
