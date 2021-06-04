ARG TILLER_CIRCLECI_BASE_IMAGE_TAG=base

FROM "itinerisltd/tiller-circleci:${TILLER_CIRCLECI_BASE_IMAGE_TAG}"

ARG DEBIAN_FRONTEND=noninteractive
ARG NODE_MAJOR_VERSION=16

# Node.js
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | sudo -E bash - && \
    sudo apt-get install -y --no-install-recommends nodejs && \
    sudo apt-get clean && sudo apt-get -y autoremove && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends yarn && \
    sudo apt-get clean && sudo apt-get -y autoremove && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define default command.
CMD ["bash"]
