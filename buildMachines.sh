#First connect to remote docker's machine 
ssh norman@containers03.cloudapp.net

#Instal docker-machine
su
curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
chmod +x /usr/local/bin/docker-machine

#Clone docker files repositories
sudo git clone https://github.com/Traceur70/dotnet-docker.git /home/dotnet-docker

#Build & run a Debian server with .NET Core
sudo docker build -t ul/dotnet /home/dotnet-docker/1.0.0-preview2/debian
sudo docker run -dit -p 81:8080 --name sysWithDotnet ul/dotnet

#Build & run an Ubuntu server without .NET Core
sudo docker build -t ul/nodotnet /home/dotnet-docker/1.0.0-preview2/ubuntuNoDotnet
sudo docker run -dit -p 82:8080 --name sysWithoutDotnet ul/nodotnet

#Get and run an ASP.NET Core app
sudo docker attach sysWithDotnet
sudo git clone https://github.com/Traceur70/UL.CrossApp.git /home/UL.CrossApp
cd /home/UL.CrossApp/src/UL.CrossApp.Web/
sudo dotnet restore 
sudo dotnet run &


#End of script
