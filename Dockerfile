FROM ubuntu:18.04

MAINTAINER mlm <email@noreply.com>

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set locale
RUN apt-get update && apt-get install -y locales && locale-gen en_US.UTF-8
ENV LANG C
ENV LANGUAGE en_US:en
ENV LC_ALL C

# Install required packages
RUN apt-get update && apt-get install -y \
    git-core \
    gnupg \
    flex \
    bison \
    gperf \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z1-dev \
    ccache \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    python \
    python-pip \
    wget \
    sudo \
    repo \
    openjdk-8-jdk \
    android-tools-adb \
    android-tools-fastboot \
    schedtool \
    libssl-dev \
    bc \
    rsync \
    nano \
    vim \
    screen \
    imagemagick \
    lsof \
    python3 \
    python3-pip \
    locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Modify the java.security file to remove TLSv1 and TLSv1.1 from disabled algorithms
RUN sed -i '/jdk.tls.disabledAlgorithms/ s/TLSv1, TLSv1.1, //' /etc/java-8-openjdk/security/java.security

# Install repo tool
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo \
    && chmod a+x /usr/local/bin/repo

# Create a non-root user
RUN useradd -m -G sudo -s /bin/bash builder
RUN echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the non-root user
USER builder
WORKDIR /home/builder

# Setup git config
RUN git config --global user.name "Your Name" \
    && git config --global user.email "your.email@example.com" \
    && git config --global color.ui true

# Create build directory
RUN mkdir -p /home/builder/android
WORKDIR /home/builder/android

# Set up environment variables
ENV USE_CCACHE=1
ENV CCACHE_DIR=/home/builder/.ccache
ENV PATH=/usr/lib/ccache:$PATH
ENV ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
ENV USER=builder

# should keep restarting jack server everytime it fails?
