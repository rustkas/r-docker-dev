# Use an official R runtime as a parent image
FROM r-base:latest

# Install usrmerge and ensure /usr merge is done before installing other packages
RUN apt update 


# Update and install required libraries
RUN apt install libpq-dev -y

# Install R packages
RUN R -e "install.packages(c('shiny', 'shinyalert'))"

# Set new workdir
WORKDIR /home/app

# Copy the app files into the Docker image
COPY src/ .

# Expose port
EXPOSE 3838

# Run the app
CMD ["R", "-e", "shiny::runApp('/home/app', host='0.0.0.0', port=3838)"]
