from fastapi import FastAPI
from transformers import pipeline

app = FastAPI()

# Create the text generation pipeline

text_generator = pipeline("text-generation", model="google/flan-t5-small")

@app.get("/")

def home():
    return {"Hello": "World"}

@app.get("/generate")

def generate(text:str):
    
    output = text_generator(text)

    return {"text_generated:":output[0]['generated_text']}