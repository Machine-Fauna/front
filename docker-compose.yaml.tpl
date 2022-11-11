version: "3.7"
services:
  mf-front-${GITHUB_REF_NAME}:
    build:
      context: .
      dockerfile: .github/Dockerfile
    container_name: mf-front-${GITHUB_REF_NAME}
    restart: unless-stopped
    stdin_open: true
    expose:
      - 80
    healthcheck:
      test: "nc -z localhost 80"
      interval: 5s
      timeout: 30s
      retries: 10
    networks:
      - mf
    labels:
      - traefik.http.routers.mf-front-${GITHUB_REF_NAME}.rule=Host(`front-${GITHUB_REF_NAME}.mf`)
      - traefik.http.routers.mf-front-${GITHUB_REF_NAME}.middlewares=mf-front-${GITHUB_REF_NAME}
      - traefik.http.middlewares.mf-front-${GITHUB_REF_NAME}.stripprefix.prefixes=/emoji-search


networks:
  ### You should create that network externally
  ### example: `docker network create -d bridge mf`
  mf:
    external: true
