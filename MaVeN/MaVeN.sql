-> Build tool that builds artifact

Vulnerability : Threat of being attacked because of API usage of third party
                this increases threat and risk 
Note: Api are used for particular functionality
     eg: ticket booked in bookmyshow we get whatsapp notification
	     this functionality can be achieved using API

To reduce vulnerability we have Maven global repository where third party companies upload api
into it
--(search.maven.org)--
we can download api from global repository to our local repository

MaVeN Installation:


-> install jdk 18 in our PC
-> go to pc-> properties-> advanced system settings ->env variables 
   -> create new JAVA_HOME variable and provide downloaded jdk path
   -> edit PATH variable and provide jdk bin path
-> download maven(.bin.zip file) 
-> once installed create new variables M2_HOME and provide maven installed path
   -> edit PATH variable and provide maven bin path

open cmd and TYPE
" mvn --version " --> to check whether maven installed or NOT

"mvn archetype:generate"  --generate project 
 --> to generate project it will ask for group-id 
    --> group id must be "com.<project-name>" or "gov.<project-name>" or "org.<project-name>"
 --> we need to provide artifact id as well 

It wil create project  and also provide path where it is located
In that we can see "SRC" and "POM.XML" 

/*SRC:
-> it contains main and test folders
-> main for developers where code will be present
-> test for testing scripts 
POM.XML:
-> it will store API information
*/

Go to created project and run below commands from CMD
---------
"mvn compile" --> it will create target folder inside project with class files

"mvn test" --> it will create test-class folder inside target folder and class files of testing scripts

"mvn package" --> it will produce artifact, will be in extension ".war" or ".jar" or ".msi" 
----------