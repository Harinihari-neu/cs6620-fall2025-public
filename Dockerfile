# Use Python slim image with Debian base (needed for audio libs)
FROM python:3.11-slim

# Install system dependencies for pygame and pydub (audio libraries)
RUN apt-get update && apt-get install -y \
    gcc \
    libsdl2-dev \
    libsdl2-mixer-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /app

# Copy requirements first 
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose Flask port
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]