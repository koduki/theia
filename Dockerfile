FROM node:10

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    vim \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - 
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

RUN mkdir /root/app
RUN mkdir /my-workspace 

WORKDIR /root/app
ADD ./package.json /root/app/package.json
RUN yarn && yarn theia build

CMD ["yarn", "theia" "start", "/my-workspace", "--hostname 0.0.0.0", "--port", "3000"]
