#First connect to remote docker's machine 
ssh norman@containers03.cloudapp.net

sudo git clone https://github.com/Traceur70/dotnet-docker.git /home/dotnet-docker

#Build & run a Debian server with .NET Core
sudo docker build -t ul/dotnet /home/dotnet-docker/1.0.0-preview2/debian
sudo docker run -dit -p 81:5000 --name sysWithDotnet ul/dotnet

#Build & run an Ubuntu server without .NET Core
sudo docker build -t ul/nodotnet /home/dotnet-docker/1.0.0-preview2/ubuntuNoDotnet
sudo docker run -dit -p 82:5000 --name sysWithoutDotnet ul/nodotnet

#To run on sysWithDotnet
sudo docker attach sysWithDotnet
sudo git clone https://github.com/Traceur70/UL.CrossApp.git /home/UL.CrossApp
cd /home/UL.CrossApp/src/UL.CrossApp.Web/
sudo dotnet restore 
sudo dotnet run &


#End of script
