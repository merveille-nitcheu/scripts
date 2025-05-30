
# Stage 1 : Build stage
FROM python:3.13-alpine AS builder1

# Set working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

RUN echo "📦 Upgrading pip and installing dependencies..." && \
    pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir --prefix=/install -r requirements.txt

RUN echo "📁 Copying application source code..."
COPY . .

FROM python:3.13-alpine

WORKDIR /app

RUN echo "📦 Copying installed Python packages from builder..."
COPY --from=builder1 /install /usr/local

# Copy application code from builder stage
RUN echo "📁 Copying application source files..."
COPY --from=builder1 /app .

# Expose the Flask app port
EXPOSE 5000

# Command to run the Flask application
CMD ["python", "app.py"]



