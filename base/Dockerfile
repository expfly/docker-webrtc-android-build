FROM ubuntu:18.04

# Update apt cache
RUN apt-get update

# Install base dependencies
RUN apt-get install -y --no-install-recommends \
    binutils \
  bison \
  bzip2 \
  cdbs \
  curl \
  dbus-x11 \
  dpkg-dev \
  elfutils \
  devscripts \
  fakeroot \
  flex \
  git-core \
  gperf \
  libappindicator3-dev \
  libasound2-dev \
  libatspi2.0-dev \
  libbrlapi-dev \
  libbz2-dev \
  libcairo2-dev \
  libcap-dev \
  libc6-dev \
  libcups2-dev \
  libcurl4-gnutls-dev \
  libdrm-dev \
  libelf-dev \
  libevdev-dev \
  libffi-dev \
  libgbm-dev \
  libglib2.0-dev \
  libglu1-mesa-dev \
  libgtk-3-dev \
  libkrb5-dev \
  libnspr4-dev \
  libnss3-dev \
  libpam0g-dev \
  libpci-dev \
  libpulse-dev \
  libsctp-dev \
  libspeechd-dev \
  libsqlite3-dev \
  libssl-dev \
  libudev-dev \
  libwww-perl \
  libxslt1-dev \
  libxss-dev \
  libxt-dev \
  libxtst-dev \
  locales \
  openbox \
  p7zip \
  patch \
  perl \
  pkg-config \
  python \
  python-crypto \
  python-dev \
  python-numpy \
  python-openssl \
  python-psutil \
  python-yaml \
  rpm \
  ruby \
  subversion \
  uuid-dev \
  wdiff \
  x11-utils \
  xcompmgr \
  xz-utils \
  zip \
    software-properties-common

# Add Java 8 PPA
RUN add-apt-repository -y ppa:openjdk-r/ppa \
    && apt-get update

# Install android compile dependencies
RUN apt-get install -y --no-install-recommends \
    build-essential \
    openjdk-8-jre \
    openjdk-8-jdk \
    ant

# Select Java 8
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java && \
    update-alternatives --set javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac && \
    update-alternatives --set jexec /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/jexec && \
    update-alternatives --set keytool /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/keytool

# Get Chromium depot tools
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /opt/depot_tools
ENV PATH /opt/depot_tools:$PATH

# Download source code
RUN mkdir webrtc && cd webrtc && fetch --nohooks webrtc_android
WORKDIR /webrtc

# Sync
RUN yes | gclient sync
