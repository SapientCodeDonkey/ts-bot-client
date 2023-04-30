# Use the latest Ubuntu image
FROM ubuntu:latest

# Set the working directory
WORKDIR /teamspeak

# Copy files from the host to the container using relative paths
COPY ./teamspeak /teamspeak/
COPY ./.ts3client /root/.ts3client
COPY ./entrypoint.sh /teamspeak/entrypoint.sh
RUN chmod +x /teamspeak/entrypoint.sh
RUN chmod +x /teamspeak/ts3client_*

# Install the required packages
RUN apt-get update && \
    apt-get install -y \
    xvfb libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-xinerama0 libxcb-xkb1 libxkbcommon-x11-0 \
    libxkbcommon0 libxcb-xtest0 libpulse0 libfontconfig libxss1 libasound2 libquazip5-1 zlib1g libgcc1 libdouble-conversion-dev libicu-dev \
    libpcre2-16-0 libzstd1 libglib2.0-0 libqt5quick5 libqt5qml5 libqt5positioning5 libnss3 libnss3-tools libnspr4 libexpat1 libfreetype6 \
    libfontconfig1 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrender1 libxtst6 libpci3 \
    libdbus-1-3 libxml2 libxslt1.1 libpcre2-8-0 libglvnd0 libpng16-16 libbrotli1 libuuid1 libxau6 libxdmcp6 libsystemd0 liblzma5 libbsd0 x11vnc

ENV DISPLAY=:1
ENV DEBIAN_FRONTEND=noninteractive
ENV XDG_RUNTIME_DIR=/tmp

ENTRYPOINT ["/teamspeak/entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
