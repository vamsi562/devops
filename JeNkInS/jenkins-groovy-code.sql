----------------- PIPELINE JOB -------------
. Most frequently used
. Implementing CI/CD using Groovy code
. code created using "GROOVY script" and file is called "JENKINS file"

--------------- IMPLEMENTATION ----------------------
. To perform pipeline job we need to install "build a pipeline" plugin
. once installed create a new job and selecct pipeline job
. newjob > pipelines > pipeline syntax
---------------- NODE ALLOCATION ------------------------
. pipeline syntax > allocate node > built-IN > generate script
   /* 
   node('built-in') 
    {
     // some block
    }
	*/

--------------- CONTINOUS DOWNLOAD -----------------------------	
.pipeline syntax > stage > continous download > generate script
   /*
    stage('continous download')
	{
     // some block
    }
	*/
 - here we will paste git hub Url 
   - pipeline syntax > git > paste url > generate script
     /*
      git 'https://github.com/sunildevops77/maven.git'	 
	 */
   - include this under continous download stage
     /*
	  stage('continous download') 
     {
       git 'https://github.com/sunildevops77/maven.git'
     }
	 */

---------------- CONTINOUS BUILD ---------------

- pipeline syntax > stage > continous build > generate script
   /*
    stage('continous build') 
	 {
      // some block
     }
	*/
- pipeline syntax > shell script > "mvn package" cmd >generate script
  /*
   sh 'mvn package'
  */
- include this under continous build
  /*
    stage('continous build') 
   {
     sh 'mvn package'
   }
  */
   
----------- CONTINOUS DEPLOYMENT ---------------------

. In free style project we used "deploy to container" to deploy to QA
. Here in pipeline project we used code to deploy to QA
. So, we need to establish passsword-less communication between dev and QA
  - password less communication
    . connect to qa server
	. "sudo passwd ubuntu" > provide password --- password for ubuntu
	. "cd /etc/ssh" --- move to ssh DIRECTORY
	. "sudo vim ssh_config" > password authentication- "yes"
	. "sudo service ssh restart" -- it will start service
    - connect to dev server
	. "ssh ubuntu@pvt-ip of qa server"
	 -- it will ask for password > by password we can CONNECT
	. "ssh-keygen" -- it will generate KEY
	. "ssh-copy-id ubuntu@pvt-ip of Qa server" -- it will copy key to qa server
	. "ssh ubuntu@pvt-ip of QA server" -- now we will be able to connect to qa server from dev without PASSWORD_GRACE_TIME

- we are now able to copy file from dev to qa
  using "scp source destination"
        " scp file1 ubuntu@qa-pvtip:/tmp/file2" -- it will copy file1 in source to file2 in destination
- deployment is nothing but copy .war file from Dev to QA server
  - we have path .war file from continous build i.e 
    "/home/ubuntu/.jenkins/workspace/groovy-practice/webapp/target/webapp.war"	
  - "scp /home/ubuntu/.jenkins/workspace/groovy-practice/webapp/target/webapp.war
    ssh ubuntu@pvt-ip of QA server:/var/lib/tomcat8/webapps/qaenv.war"
  - pipeline syntax > shell script > "scp /home/ubuntu/.jenkins/workspace/groovy-practice/webapp/target/webapp.war
    ssh ubuntu@pvt-ip of QA server:/var/lib/tomcat8/webapps/qaenv.war"
   /* 
     sh 'scp /home/ubuntu/.jenkins/workspace/groovy-practice/webapp/target/webapp.war 
	 ubuntu@pvtip of qa server:/var/lib/tomcat8/webapps/qaenv.war' 
   */	 

- pipeline syntax > stage > continous deployment > generate script
   /*
    stage('continous deployment') 
	 {
      // some block
     }
	*/
- pipeline syntax > shell script > 
    "scp /home/ubuntu/.jenkins/workspace/groovy-practice/webapp/target/webapp.war 
    ubuntu@172.31.14.162:/var/lib/tomcat8/webapps/qaenv.war"
  /* 
  (sh 'scp /home/ubuntu/.jenkins/workspace/groovy-practice/webapp/target/webapp.war 
  ubuntu@172.31.14.162:/var/lib/tomcat8/webapps/qaenv.war')
  */
- include this under continous deployment
  /*
   stage('continous deployment') 
	 {
      sh 'scp /home/ubuntu/.jenkins/workspace/groovy-practice/webapp/target/webapp.war 
      ubuntu@172.31.14.162:/var/lib/tomcat8/webapps/qaenv.war'
     }
  */
. we need to provide  others writ permission for tomcat8 directory in qa server
  " sudo su
    cd /var/lib  --will move lib
    chmod 777 tomcat8 --"

------------ continous testing -------------------
. pipeline syntax > stage > continous testing > generate script
   /*
    stage('continous testing') 
	 {
      // some block
     }
	*/
. pipeline syntax > shell script >
    "(echo "testing succeeded")"
. include in continous testing
  /*
   stage('continous testing') 
   {
    sh 'echo "testing succeeded"' 
   } 
  */
---------------- CONTINOUS DELIVERY ----------------------

. we need to establish password less connection between dev and prod server
. 
   /*
   stage('continous delivery') 
	 {
      sh '''scp /home/ubuntu/.jenkins/workspace/groovy-practice/webapp/target/webapp.war 
      ubuntu@172.31.10.138:/var/lib/tomcat8/webapps/prodenv.war'''
     }
   */
   
   
------------------ FINAL GROOVY CODE ---------------------------------

node('built-in')
 {
  stage('continous download') 
  {
    git 'https://github.com/sunildevops77/maven.git'
  } 
   stage('continous build') 
  {
    sh 'mvn package'
  }
  stage('continous deployment') 
  {
    sh 'scp /home/ubuntu/.jenkins/workspace/groovy-practice/webapp/target/webapp.war 
    ubuntu@172.31.14.162:/var/lib/tomcat8/webapps/qaenv.war'
  } 
  stage('continous testing') 
  {
   sh 'echo "testing succeeded"' 
  }
  stage('continous delivery') 
  {
    sh '''scp /home/ubuntu/.jenkins/workspace/groovy-practice/webapp/target/webapp.war 
      ubuntu@172.31.10.138:/var/lib/tomcat8/webapps/prodenv.war'''
  }  
 }   