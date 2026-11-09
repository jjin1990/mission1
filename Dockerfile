FROM nginx:alpine
LABEL maintainer="jjin1990" description="Codyssey mission1 custom nginx"
COPY app/ /usr/share/nginx/html/
EXPOSE 80