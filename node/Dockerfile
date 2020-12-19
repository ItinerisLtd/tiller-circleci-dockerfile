ARG TILLER_CIRCLECI_BASE_IMAGE_TAG=base

FROM "itinerisltd/tiller-circleci:${TILLER_CIRCLECI_BASE_IMAGE_TAG}"

ARG DEBIAN_FRONTEND=noninteractive

ENV NVM_DIR   /home/circleci/nvm
ENV NODE_PATH $NVM_DIR/v8.17.0/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v8.17.0/bin:$PATH

# Node.js
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN mkdir -p $NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash && \
    source $NVM_DIR/nvm.sh && \
    nvm install 8 && \
    nvm use 8

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends yarn && \
    sudo apt-get clean && sudo apt-get -y autoremove && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Sage
RUN sudo add-apt-repository ppa:linuxuprising/libpng12 && \
    sudo apt-get -q update && \
    sudo apt-get install -q -y --no-install-recommends libpng12-0 && \
    sudo apt-get clean && sudo apt-get -y autoremove && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define default command.
CMD ["bash"]
