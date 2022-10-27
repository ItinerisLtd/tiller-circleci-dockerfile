FROM cimg/python:3.11.0

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
RUN curl -sL https://raw.githubusercontent.com/roots/trellis-cli/master/scripts/get | bash -s -- -d -b ~/bin

# Define default command.
CMD ["bash"]
