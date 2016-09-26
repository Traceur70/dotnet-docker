#First connect to remote docker's machine 
ssh norman@containers03.cloudapp.net

#Build & run a Debian server with .NET Core
sudo git clone https://github.com/Traceur70/dotnet-docker.git /home
sudo docker build -t ul/dotnet /home/dotnet-docker/1.0.0-preview2/debian
sudo docker run -dit -p 80:8080 --name sysWithDotnet ul/dotnet

#Build & run an Ubuntu server without .NET Core
sudo docker run -dit -p 81:8080 --name sysWithoutDotnet ubuntu:latest 

sudo docker attach sysWithDotnet
git clone https://github.com/Traceur70/UL.CrossApp.git /home
dotnet restore /home/UL.CrossApp/UL.CrossApp.Web3/
dotnet run /home/UL.CrossApp/UL.CrossApp.Web3/ &
exit

#End of script
