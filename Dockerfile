FROM gcr.io/deeplearning-platform-release/workbench-container:20250324-2200-rc0

USER root

# Install dependencies for Kotlin Jupyter
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    zip \
    openjdk-11-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Kotlin Jupyter kernel
RUN pip install kotlin-jupyter-kernel

# Install Kotlin kernel for Jupyter
RUN jupyter kernelspec install --user $(pip show kotlin-jupyter-kernel | grep Location | cut -d' ' -f2)/kotlin_jupyter_kernel/kernel

# Switch back to the default user
USER jupyter

# Verify installation
RUN jupyter kernelspec list

# Set working directory
WORKDIR /home/jupyter

# The container will start Jupyter by default when used with VertexAI Workbench
