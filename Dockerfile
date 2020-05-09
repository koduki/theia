FROM node:10

RUN apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y  \
        docker-ce  \
        docker-ce-cli  \
        containerd.io \
        vim

RUN mkdir /home/theia
RUN mkdir /home/project

WORKDIR /home/theia
ADD ./package.json package.json
RUN yarn && yarn theia build

CMD ["yarn", "theia" "start", "/home/project", "--hostname 0.0.0.0", "--port", "3000"]
