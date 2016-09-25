#First connect to remote docker's machine 
ssh norman@containers03.cloudapp.net

#Build & run a Debian server with .NET Core
cd /home
sudo git clone https://github.com/Traceur70/dotnet-docker.git
sudo docker build -t ul/dotnet dotnet-docker/1.0.0-preview2/debian
sudo docker run -dit -p 80:8080 --name sysWithDotnet ul/dotnet

#Build & run an Ubuntu server without .NET Core
sudo docker run -dit -p 81:8080 --name sysWithoutDotnet ubuntu:latest 

sudo docker attach dotnetCont
cd home/
git clone https://github.com/Traceur70/UL.CrossApp.git
cd UL.CrossApp/UL.CrossApp.Web3/
dotnet restore
dotnet run &
