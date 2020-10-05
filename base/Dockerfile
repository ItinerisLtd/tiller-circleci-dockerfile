ARG PYTHON_MINOR_VERSION=3.8

FROM "cimg/python:${PYTHON_MINOR_VERSION}"

ARG DEBIAN_FRONTEND=noninteractive

# For Ansible git module
RUN sudo ln -s "$(which python)" /usr/bin/python

# For Trellis, specifically: Ansible's synchronize module
RUN sudo apt-get -q update && \
    sudo apt-get install -q -y --no-install-recommends rsync && \
    sudo apt-get clean && sudo apt-get -y autoremove && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# For Trellis CLI, specifically: `trellis init`
RUN pip install --no-cache-dir virtualenv

# Trellis CLI
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sL https://roots.io/trellis/cli/get | bash -s -- -d -b ~/bin

# # Basic smoke test
RUN echo "python --version" && python --version && \
    echo "which python" && \
    echo "/usr/bin/python --version" && \
    echo "pip --version" && pip --version && \
    echo "pip check" && pip check && \
    echo "virtualenv --version" && virtualenv --version && \
    echo "rsync --version" && rsync --version && \
    echo "trellis --version" && trellis --version

# Define default command.
CMD ["bash"]
