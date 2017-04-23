FROM node:6.10-slim

ENV WINDSHAFT_VERSION 3.1.0
ENV EXPRESS_VERSION 4.15.2

RUN mkdir -p /opt/windshaft

WORKDIR /opt/windshaft

RUN set -ex \
  && buildDeps=' \
    build-essential \
    checkinstall \
    git-core \
    libcairo2-dev \
    libjpeg62-turbo-dev \
    libgif-dev \
    libpq-dev \
    ' \
  && deps=' \
    libcairo2 \
    libgif4 \
    libjpeg62-turbo \
    libpango1.0-dev \
    libpixman-1-0 \
    ' \
  && apt-get update && apt-get install -y ${buildDeps} ${deps} --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && npm install --unsafe-perm express@${EXPRESS_VERSION} \
     windshaft@${WINDSHAFT_VERSION} \
     body-parser \
  && apt-get purge -y --auto-remove ${buildDeps}

COPY upgrade_glibc.sh /tmp/
RUN /tmp/upgrade_glibc.sh && rm -f /tmp/upgrade_glibc.sh

EXPOSE 5000

ENTRYPOINT ["node"]
