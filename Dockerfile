FROM node:10


RUN mkdir /root/app
RUN mkdir /my-workspace 

WORKDIR /root/app
ADD ./package.json /root/app/package.json
RUN yarn && yarn theia build

RUN apt-get update

CMD ["yarn", "theia","start", "/my-workspace", "--hostname", "0.0.0.0", "--port", "3000"]

# RUN yarn --cache-folder ./ycache && rm -rf ./ycache && \
#     NODE_OPTIONS="--max_old_space_size=4096" yarn theia build ;\
#     yarn theia download:plugins

