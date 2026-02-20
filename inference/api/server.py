from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="GhostGPT Inference")

class Prompt(BaseModel):
    prompt: str

@app.get("/")
def root():
    return {"status": "GhostGPT alive 👻"}

@app.post("/generate")
def generate(p: Prompt):
    return {"output": f"Echo: {p.prompt}"}
