# Use an official Python base image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Copy rest of the repo
COPY . .

# Install uuid generator & create machine-id
RUN apt-get update && apt-get install -y uuid-runtime && \
    uuidgen > /etc/machine-id


# Make the server binary executable
RUN chmod 777 bombsquad_server
RUN chmod 777 dist/bombsquad_headless
RUN chmod +x dist/bombsquad_headless
RUN chmod 777 dist/bombsquad_headless_aarch64
RUN chmod +x dist/bombsquad_headless_aarch64

# Expose whatever port the server listens on.
# You need to check which port it uses in config.yaml.
EXPOSE 43210

# Default command
CMD ["./bombsquad_server"]
