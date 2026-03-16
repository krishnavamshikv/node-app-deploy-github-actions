# Stage 1: Build
FROM node:22-alpine AS builder
RUN apk update && apk upgrade --no-cache
WORKDIR /app
COPY package*.json ./
# Install ALL dependencies (including those needed for builds/tests)
RUN npm install 
COPY . .

# Stage 2: Run
FROM node:22-alpine AS runner
RUN apk update && apk upgrade --no-cache
WORKDIR /app
# Only copy production dependencies and the source code
COPY --from=builder /app/package*.json ./
RUN npm install --only=production
COPY --from=builder /app/main.js .

# Security Best Practice: Don't run as root
USER node

EXPOSE 8080
CMD ["node", "main.js"]