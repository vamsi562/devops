---------- DOCKER -------------
> containerisation Tool
> Also for infrastructure provisionning
> helps in rapid deployment with min runtime requirements
> Better management and simplified portability
> provide light weight containers to run in process ISOLATION

------------- Virtualisation --------------------
/*
        Virtual machines created --> we will install os and required applicatons on that os " guest os"
             ^
        Vmware installed 
             ^
        operating system --> host OS
             ^  
        Hardware/laptop
*/

> In virtualisation there is fixed allocation of hardware resources.
> for application we  can provide memory based on our hardware

"Guest OS" : OS which we install on virtual machines which created on vmware
"Host OS"  : OS installed on hardware

----------- CONTAINERISATION ----------------------
/*
        containers/images     
			 ^
        CONTAINERISATION tool
             ^
        HOST OS      
             ^
        Hardware/laptop
*/
> Docker runs on process isolation i.e no guest os required
> No allocation of hardware resources
> eg: if tomcat running on containerisation tool it is called container
> app performance is good compared to app running on vmware
> 

----------- INSTALLING DOCKER -------------------
. Create a EC2 Instance with ubuntu 18.04 LTS amazon image
https://get.docker.com
connect to machine and run below commands
"sudo su" --> to change to root user

"curl -fsSL https://get.docker.com -o get-docker.sh"
"sh get-docker.sh"

"docker --version"   --> check whether docker installed or not

------------ TERMINOLOGIES ---------------

> "Docker host" : instance where docker is installed.
> "Docker client": terminal which is used to run docker commands.
> "Docker Images": combination of bin/libraries which are necessary for one software application.
> "Docker Containers": when docker image is downloaded and running.