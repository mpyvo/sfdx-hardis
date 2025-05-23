# Docker image to run sfdx-hardis

FROM python:3.12.10-alpine3.21

LABEL maintainer="Nicolas VUILLAMY <nicolas.vuillamy@cloudity.com>"

RUN apk add --update --no-cache \
            coreutils \
            git \
            bash \
            nodejs \
            npm \
            # Required for docker
            docker \
            openrc \
            # Required for puppeteer
            chromium \
            nss \
            freetype \
            harfbuzz \
            ca-certificates \
            ttf-freefont

# Start docker daemon in case mermaid-cli image is used
RUN rc-update add docker boot && (rc-service docker start || true)

# Do not use puppeteer embedded chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"
ENV CHROMIUM_PATH="/usr/bin/chromium-browser"
ENV PUPPETEER_EXECUTABLE_PATH="${CHROMIUM_PATH}"

# Add node packages to path #
# hadolint ignore=DL3044
ENV PATH="/node_modules/.bin:${PATH}"

ARG SFDX_CLI_VERSION=latest
ARG SFDX_HARDIS_VERSION=latest

# Install npm packages +install sfdx plugins & display versions
RUN npm install --no-cache yarn -g && \
    npm install --no-cache @salesforce/cli@${SFDX_CLI_VERSION} -g && \
    sf plugins install @salesforce/plugin-packaging && \
    sf plugins install @salesforce/plugin-deploy-retrieve && \
    echo 'y' | sf plugins install sfdx-hardis@${SFDX_HARDIS_VERSION} && \
    echo 'y' | sf plugins install sfdmu && \
    echo 'y' | sf plugins install sfdx-git-delta && \
    echo 'y' | sf plugins install texei-sfdx-plugin && \
    sf version --verbose --json && \
    rm -rf /root/.npm/_cacache

ENV MERMAID_MODES="docker"

# Workaround for https://github.com/forcedotcom/salesforcedx-apex/issues/213
COPY ref/workarounds/dateUtil.js /usr/local/lib/node_modules/@salesforce/cli/node_modules/@salesforce/apex-node/lib/src/utils/dateUtil.js
COPY ref/workarounds/junitReporter.js /usr/local/lib/node_modules/@salesforce/cli/node_modules/@salesforce/apex-node/lib/src/reporters/junitReporter.js
