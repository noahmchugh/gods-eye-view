FROM node:24-slim
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --no-audit --no-fund
COPY . .
RUN npx vite build --config vite.config.deploy.mjs
ENV HOST=0.0.0.0 PORT=4173
EXPOSE 4173
CMD ["npx", "vite", "preview", "--config", "vite.config.deploy.mjs"]
