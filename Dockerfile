FROM caddy:alpine
COPY doc /srv
COPY Caddyfile /etc/caddy/Caddyfile
EXPOSE 80
