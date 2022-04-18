JENKINS :
. CI/CD tool
. self contained open source automation server which is used to automate all tasks related to 
  building , testing and delivery activities

-------- CICD PROCESS ----------------
CI/CD:
It happens in five stages
. STAGE-I : CONTINOUS DOWNLOAD
. STAGE-II : CONTINOUS BUILD
. STAGE-III : CONTINOUS DEPLOYMENT
. STAGE-IV : CONTINOUS TESTING
. STAGE-V : CONTINOUS DELIVERY

--------- INFRA ------------

To perform above tasks we need Infra i.e EC2 INSTANCES
Total 3 instances each for DEV,QA,PROD
create 3 instances using UBUNTU 18.04LTS Image

-------- CONTINOUS DOWNLOAD -------
Downloading source from GitHub 
To perform this we need to install GIT in Dev server

--------- CONTINOUS BUILD ---------
Once the source code is downloaded from SCM we need to build PACKAGE to produce Artifact
For producing Artifact we need to install Maven in Dev server

-------- CONTIONUS DEPLOYMENT ------
Artifact produced will be deployed to testing server(QA)

------- CONTIONUS TESTING --------
Testing team test code using testing scripts

------- CONTINOUS DELIVERY --------
Once testing done we will move it to production

------ Requirements ---------------

Java runtime for jenkins
Git for SCM
Maven for packaging code and producing artifact

---------Installation Process --------------
. Create an EC2 Instance using UBUNTU 18.04 LTS image and name it as DEV sever
. Connect to Dev server 
. Update packages using "sudo apt-get update"
. Installing java run time for jenkins 
     "sudo apt install openjdk-8-jdk -y"
. Check whether installed or NOT
  " java -version"
. Installing GIT  
  " sudo apt install -y git"
. Installing Maven 
  "sudo apt install -y maven"
. commands to check whether maven and git installed 
  "git -version
   mvn -version"
. To install jenkins we will import url from jenkins.io/download '.war url of stable LTS'
  " wget copiedurl"
. To start JENKINS
  "java -jar jenkins.war"
  -  after this cmd run we will get password and its location where it stored --store password
  -  as we are practicing we will stop instances once our work done, 
     but at enterprise level instances will run continously
  -  whenever we stop server we need to run above cmd to start jenkins
. once installation done to connect to jenkins we use Public-ip of server on which jenkins installed
  -  "public-ip of server:8080" in browser
  -  it will ask for password ---paste above stored password
  -  select install plugins specified
  -  create user by providing necessary details
  - once logged into jenkins if facing any crumb issue fix it by 
     manage jenkins -> configure global security -> enable proxy compatibility -> Apply & save
	 
-------- Creating sample project in jenkins ------------
. Create a new project/Job to print "Hello jenkins" :
  - provie any name
  - select freestyle project
. once job created:
  - go to build -> select execute shell -> type echo "hello jenkins"
  - save and apply
. once saved build -> Build now 
. once job succeded we can see output in "Console Output"


	 
	 
    
  