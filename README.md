# LiteLLM Proxy Setup

A pre-configured [LiteLLM Proxy](https://github.com/BerriAI/litellm) server designed for hosting and routing requests to OpenAI and Gemini models, equipped with configurations for both local Docker development and deployment on [Railway.com](https://railway.com).

## Supported Models

The proxy routes requests for the following model IDs:

- **OpenAI**:
  - `gpt-4o` (mapped to `openai/gpt-4o`)
  - `gpt-4o-mini` (mapped to `openai/gpt-4o-mini`)
  - `o1-preview` (mapped to `openai/o1-preview`)
- **Gemini (Google AI Studio)**:
  - `gemini-1.5-flash` (mapped to `gemini/gemini-1.5-flash`)
  - `gemini-1.5-pro` (mapped to `gemini/gemini-1.5-pro`)
  - `gemini-2.0-flash` (mapped to `gemini/gemini-2.0-flash`)
  - `gemini-2.5-flash` (mapped to `gemini/gemini-2.5-flash`)

---

## Local Setup & Development

### 1. Prerequisites
- [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/)

### 2. Configure Environment Variables
Copy the template file to create your local `.env`:
```bash
cp .env.example .env
```
Open `.env` and fill in your actual API keys:
- `OPENAI_API_KEY`: Your OpenAI platform key.
- `GEMINI_API_KEY`: Your Google AI Studio/Gemini key.
- `LITELLM_MASTER_KEY`: The authorization token needed to query this LiteLLM proxy itself (default: `sk-litellm-master-key-1234`).

### 3. Spin Up the Service
Run the Docker Compose suite:
```bash
docker compose up -d --build
```
This builds the image locally using the [Dockerfile](Dockerfile) and starts Uvicorn listening on port `4000`.

### 4. Test the API
You can run the included test script to verify both integrations:
```bash
sh test.sh
```
This sends curl requests to `/v1/chat/completions` using the proxy's master token.

---

## Railway.com Deployment

This repository is ready to deploy directly to **Railway**.

### How it works:
1. **[railway.toml](railway.toml)** instructs Railway to build the service using the local **[Dockerfile](Dockerfile)**.
2. The **[Dockerfile](Dockerfile)** clears the parent entrypoint and launches LiteLLM via a shell wrap (`sh -c ...`). This dynamically binds to the `$PORT` environment variable injected by Railway at runtime.
3. Railway automatically monitors readiness using the health check path `/health/readiness`.

### Steps to Deploy:
1. Push this project to your GitHub repository.
2. Log in to [Railway.com](https://railway.com) and create a **New Project** linked to your GitHub repository.
3. In the Railway service settings, add the following variables under **Variables**:
   - `OPENAI_API_KEY`
   - `GEMINI_API_KEY`
   - `LITELLM_MASTER_KEY`
4. Deploy the service. Once deployed, Railway will assign a public domain where you can access the proxy.
