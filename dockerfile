FROM nginx

# Generate self-signed SSL certificate
RUN mkdir -p /etc/ssl/certs /etc/ssl/private && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=ID/ST=Indonesia/L=Jakarta/O=Universitas Majapahit/CN=localhost" \
    -keyout /etc/ssl/private/self-signed.key \
    -out /etc/ssl/certs/self-signed.crt

# Copy custom Nginx config
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy static content
COPY src/ /usr/share/nginx/html/ 

EXPOSE 8000 443  

CMD ["nginx", "-g", "daemon off;"]
