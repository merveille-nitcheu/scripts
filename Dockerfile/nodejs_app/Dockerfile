
FROM node:23-alpine AS builder

# Set working directory
WORKDIR /app

RUN echo "📦 Copying package.json and installing dependencies..."
COPY package*.json ./
RUN npm install

RUN echo "📁 Copying application source code..."
COPY . .

FROM node:23-alpine

WORKDIR /app

RUN echo "🚀 Copying build from builder stage..."
COPY --from=builder /app ./

# Expose the Node.js app port
EXPOSE 3000

CMD ["node", "app.js"]