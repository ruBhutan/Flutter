from fastapi import FastAPI

app = FastAPI()

# Home page


@app.get('/')
async def get_home():
    return '<b> Home page </b>'

# about


@app.get('/about/{id}')
def get_about(id: int):
    return f"About page {id}"
