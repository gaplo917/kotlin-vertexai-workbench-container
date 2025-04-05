FROM alpine:latest

# Create a simple script that prints Hello World
RUN echo '#!/bin/sh' > /hello.sh && \
    echo 'echo "Hello, World from VertexAI Workbench Container!"' >> /hello.sh && \
    chmod +x /hello.sh

# Set the entrypoint to run the script
ENTRYPOINT ["/hello.sh"]
