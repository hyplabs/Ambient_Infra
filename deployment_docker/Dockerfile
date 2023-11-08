# Use an official Debian runtime as a parent image
FROM debian:bullseye-slim

# Install prerequisites
RUN apt-get update && \
    apt-get install -y curl apt-transport-https lsb-release gnupg && \
    apt-get clean

# Install Google Cloud SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    apt-get update -y && apt-get install -y google-cloud-sdk

# Install kubectl
RUN apt-get install -y kubectl


RUN curl -O "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-453.0.0-linux-x86_64.tar.gz"

RUN tar zxvf "google-cloud-sdk-453.0.0-linux-x86_64.tar.gz"

RUN ./google-cloud-sdk/install.sh --quiet

COPY ./config_stage/* ./

# Setup the entrypoint
#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh

# Set the working directory
#WORKDIR /

# The entrypoint script should handle the population of secret files, gcloud and kubectl configurations.
# Ensure you create an `entrypoint.sh` script that configures everything as needed.
#ENTRYPOINT ["/entrypoint.sh"]

# Keep the container running
CMD ["tail", "-f", "/dev/null"]