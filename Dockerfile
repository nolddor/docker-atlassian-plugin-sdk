ARG OPENJDK

FROM eclipse-temurin:${OPENJDK}-jdk-alpine

LABEL maintainer="Jack Nolddor" \
    org.opencontainers.image.authors="Jack Nolddor" \
    org.opencontainers.image.url="https://github.com/nolddor/docker-atlassian-sdk" \
    org.opencontainers.image.documentation="https://github.com/nolddor/docker-atlassian-sdk/wiki" \
    org.opencontainers.image.source="https://github.com/nolddor/docker-atlassian-sdk"

WORKDIR /opt

# Install the latest version of Atlassian SDK
# Refers to https://developer.atlassian.com/server/framework/atlassian-sdk/install-the-atlassian-sdk-on-a-linux-or-mac-system/#-tgz-file
RUN wget https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz
RUN tar -xvzf atlassian-plugin-sdk-tgz
RUN rm -f atlassian-plugin-sdk-tgz
RUN mv atlassian-plugin-sdk-* atlassian-plugin-sdk
ENV PATH="/opt/atlassian-plugin-sdk/bin:$PATH"

RUN atlas-version
CMD [ "sh" ]