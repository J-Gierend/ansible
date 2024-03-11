# Use the official Ubuntu base image
FROM ubuntu:latest

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Update the package repository and install bash
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

# Install tzdata package
RUN apt-get update && apt-get install -y tzdata

# Set the timezone
ENV TZ=Europe/Berlin
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# Other Packages
RUN apt-get install sudo curl -y

# Set the default command to execute
# when creating a new container
CMD ["/bin/bash"]

