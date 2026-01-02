from fastapi import FastAPI, File, UploadFile, HTTPException, status
from contextlib import asynccontextmanager
import httpx
import os
import base64

img_path = os.path.expanduser("~/Desktop/assignment2/backend/img2.png")

@asynccontextmanager
async def lifespan(app: FastAPI):
     async with httpx.AsyncClient(timeout=120) as client:
          try:
               await client.post(
                    "http://localhost:11434/api/chat",
                    # "http://10.42.0.150:11434/api/chat",
                    json={
                         "model": "llava:7b",
                         "messages": [{"role": "user", "content": "hello"}],
                         "stream": False
                    }
               )
          except Exception as e:
               print("Ollama warmup failed--", e)
     yield
     print("shutting down app")

app = FastAPI(lifespan=lifespan)

# app = FastAPI()


@app.post("/hello")
async def read_root():
     return {"message": "hello world"}


@app.post("/analyze1")
async def analyze1(image_url: str):
    # Your n8n webhook URL
     n8n_webhook = "https://your-n8n-instance.com/webhook/analyze-image"
     async with httpx.AsyncClient() as client:
          response = await client.post(
               n8n_webhook,
               json={"image_url": image_url}
          )
    
     return response.json()

