FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Install AWS CLI
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends curl unzip \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm -rf awscliv2.zip aws \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV AWS_CLI_AUTO_PROMPT=on-partial

# Install ruby
RUN apt-get update && \
    apt-get install -y ruby-full && \
    rm -rf /var/lib/apt/lists/*

# Install Bundler
RUN gem install bundler

# To easily use ruby, run these commands after the environment is rebuilded, do not add in to run in Dockerfile
# bundle config set --local path '/workspaces/AWS-Examples/s3/sdk/ruby/vendor/bundle'
# bundle install

# Install Java
RUN apt-get update && \
    apt-get install -y default-jre && \
    rm -rf /var/lib/apt/lists/*

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

# Install terraform (source: https://developer.hashicorp.com/terraform/install)
RUN wget -O- https://apt.releases.hashicorp.com/gpg \
    | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" \
    > /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y terraform && \
    rm -rf /var/lib/apt/lists/*

# Install npm
RUN apt-get update && \
    apt-get install -y nodejs npm

# Install cdk
RUN npm i -g aws-cdk