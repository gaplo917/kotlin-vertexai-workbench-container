FROM us-docker.pkg.dev/deeplearning-platform-release/gcr.io/workbench-container:latest

# Install dependencies for Kotlin Jupyter
RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Kotlin Jupyter kernel
RUN pip install kotlin-jupyter-kernel

# Verify installation
RUN jupyter kernelspec list

ENV KOTLIN_JUPYTER_JAVA_OPTS="-Xmx4g"

# The container will start Jupyter by default when used with VertexAI Workbench
