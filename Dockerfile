# Use the official Python 3.12 image as the base image
FROM python:3.12

# Set the working directory inside the container
WORKDIR /app

# Copy requirements.txt from the backend directory
COPY ./Backend-app/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the backend code
COPY ./Backend-app /app

# Define ARG for each environment variable
ARG DATABASE_URL
ARG EMAIL
ARG GOOGLE_APPLICATION_CREDENTIALS
ARG LANGCHAIN_API_KEY
ARG LANGCHAIN_TRACING_V2
ARG LANGCHAIN_ENDPOINT
ARG SHOPIFY_STORE
ARG OPENPHONE_API_KEY
ARG SHOPIFY_ACCESS_TOKEN
ARG OPENAI_API_KEY

# Set environment variables using the ARG values
ENV DATABASE_URL=${DATABASE_URL}
ENV EMAIL=${EMAIL}
ENV GOOGLE_APPLICATION_CREDENTIALS=${GOOGLE_APPLICATION_CREDENTIALS}
ENV LANGCHAIN_API_KEY=${LANGCHAIN_API_KEY}
ENV LANGCHAIN_TRACING_V2=${LANGCHAIN_TRACING_V2}
ENV LANGCHAIN_ENDPOINT=${LANGCHAIN_ENDPOINT}
ENV SHOPIFY_STORE=${SHOPIFY_STORE}
ENV OPENPHONE_API_KEY=${OPENPHONE_API_KEY}
ENV SHOPIFY_ACCESS_TOKEN=${SHOPIFY_ACCESS_TOKEN}
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["python", "-m", "app.app"]