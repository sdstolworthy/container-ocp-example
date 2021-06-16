FROM fedora:latest

RUN dnf -y update && dnf -y install npm nginx && dnf clean all

RUN npm install -g serve

COPY index.html /website/

COPY nginx.conf /etc/nginx/nginx.conf

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 8080

EXPOSE 8081

# CMD ["serve", "/website", "-p", "8080"]
CMD ["/usr/sbin/nginx"]
