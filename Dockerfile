# Use the python image for version 3.12.4
FROM python:3.12.4

# Set the working directory
WORKDIR /code

# Copy the current directory content in the container 
COPY  ./requirements.txt /code/requirements.txt

# Install the required packages
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Create a user
RUN useradd user

# Switch to the new user
USER user

# Set the home directory
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

# Update the working directory
WORKDIR $HOME/app

# Copy the current directory into the container at $HOME/app and given right to the user
COPY --chown=user . $HOME/app

# Run the app on a port
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]
