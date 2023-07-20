# This will use the nginx container as a base.
# This container will setup most of the routing nitty gritty for you.
FROM nginx

# Here we copy your project files from "." (The current folder)
# and paste them at "/usr/share/nginx/html",
# this is where nginx hosts static files
# nginx will automatically host "index.html"
COPY . /usr/share/nginx/html

# To build this project, run the following command
# "docker build -t joes-awesome-website ."

# To break this down;

# "docker build", running just this will show you all of the possible build commands you can run, you can also add on "--help" to get more information

# "-t joes-awesome-website", -t stands for TAG, this can be set to anything you want
# by default this will add ":latest" to your image so your actual container will be "joes-awesome-website:latest",
# but if you want to specify the version yourself, you can do "-t joes-awesome-website:1.2.0"
# (you can add as many numbers here as you would like, its your naming scheme after all)

# "." Finally we point docker to the folder where your Dockerfile is stored 
# here i just choose the current folder with ".", but you may want to choose a subfolder by doing "./code/docker"



# Now we can run your shiny new container!
# "docker run -it --rm -d -p 8080:80 --name joes-website joes-awesome-website"


# "docker run" went over this in the previous command, all information applies here as well.

# "-it" the simplest way to explain this is it will keep a virtual shell open even if your current shell closes,
# best to just add this to most of you run commands until you understand it

# "--rm" this means that the container will be removed when it stops,
# This helps because if you ever stop the container, everything will be automatically cleaned up and deleated
# If you dont add this you will have to clean up 'dead' containers in the future.
# to see these 'dead' containers you can run "docker ps -a" (docker 'process' 'all')

# "-d" this will 'detatch' your container from your current shell,
# this means it wont dump information to your current teminal and will instead run in the background

# "-p 8080:80"
# -p is for port forwarding
# the first number is the port you want exposed to the open internet, in this case the server i lent you has port 8080 open
# the second number is the application's port, nginx's default is 80 for http and 443 for https

# "--name joes_website" this is the name of *this* container instance, in the future you may want to spin up 2, 3, or even 10+ copies of the same container
# when you stop the container you will use this name by running "docker stop joes_website", and this is the name that will show up in your running container list "docker ps"

# "joes-awesome-website" this is the container you are planning to run, if you dont specify a version :latest is selected by default.
