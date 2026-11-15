FROM node:24-slim
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --no-audit --no-fund
COPY . .
ENV HOST=0.0.0.0 PORT=4173
EXPOSE 4173
CMD ["npm", "run", "dev"]
