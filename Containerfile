FROM fedora:latest

RUN dnf -y update && dnf -y install nginx && dnf clean all

COPY index.html /website/

COPY nginx.conf /etc/nginx/nginx.conf

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN chown -R nginx:root /website && chmod -R 755 /website && \
        chown -R nginx:root /var/log/nginx && \
        chown -R nginx:root /etc/nginx/conf.d

EXPOSE 8081

CMD ["nginx"]
