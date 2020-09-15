FROM haxe:3.4

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install dependencies
COPY *.hxml /usr/src/app/
RUN yes | haxelib install all

# compile the project
COPY . /usr/src/app
RUN haxe build.hxml

# run the output when the container starts
# CMD ["neko", "Main.n"]

FROM node:current-alpine3.11
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /usr/src/app/main.js .
RUN ls
CMD ["node","./main.js"]  
