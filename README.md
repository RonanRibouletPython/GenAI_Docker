# GenAI_Docker

This project is a starting point for building generative AI applications and deploying it in HuggingFace Spaces


## Steps to create the project

- Create a conda environment with the latest version of python
```bash
  conda create -p venv python -y
```
- Create a requirements.txt file in which you list all the required packages for the project

- Write code for the REST Api application (with FastAPI of Flask)

- Create a Docker file for the containerization of the project and the deployment on HF Spaces


## Docker File explanation

- Specify the current python version you use for the project

```code
 FROM python:3.12.4
```

- Set the working directory of your project

```code
WORKDIR /code
```

- Copy the requirements.txt file with the packages you need to run the project
```code
COPY  ./requirements.txt /code/requirements.txt
```

- Install the required packages
```code
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
```

- Create a new user and switch to it
User creation:
```code
RUN useradd user
```
Switch to the user:
```code
USER user
```

- Set environment variables for the Home directory  
```code
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH
```

- Update the working directory
```code
WORKDIR $HOME/app
```

- Copy the current directory into the container at $HOME/app and given right to the user
```code
COPY --chown=user . $HOME/app
```

- Run the app on a port
```code
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]
``` 


## Deployment

Explanation to deploy the project in an Hugging Face Space

- First login to your Hugging Face account

- Then go to Spaces and click on Create a new Space

- Give a new Space name (without spaces)

- Chose a license (MIT for example)

- Chose Docker as SpaceSDK and chose the blank template

- Chose a space Hardware: the free version is called CPU basic . 2v CPU . 16GB . FREE

- Chose if your space should be private or public 

- Click on create space

- Once the space is created go to Files and click on + Add file

- Take the requirements.txt, the app.py and the Dockerfile files and commit the changes

- Once the push of the files is done the build of the project will automatically start

- Once it is done go to Embed this space and click on the direct URL

- Use the FastAPI swagger by adding /docs to your URL

- Try your GenAI application ;)