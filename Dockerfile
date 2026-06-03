FROM ghcr.io/berriai/litellm:main-stable

# Clear the default entrypoint so we can run litellm through shell and evaluate $PORT
ENTRYPOINT []

# Copy the configuration file into the container
COPY litellm_config.yaml /app/config.yaml

# Expose default port (informative)
EXPOSE 4000

# Start LiteLLM proxy, dynamically binding to the PORT env variable provided by Railway
CMD ["sh", "-c", "litellm --config /app/config.yaml --port ${PORT:-4000} --host 0.0.0.0"]
