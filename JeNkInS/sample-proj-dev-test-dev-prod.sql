CI/CD PROCESS
------- CONTINOUS DOWNLOAD ----------------

. create a project and under SCM select GIT and Paste GITHUB URL
. build now --> check console output once succeeded

-------- CONTINOUS BUILD ---------------------

. under the same project -> configure now --> build
. add build step --> invoke top level maven targets
. under goals add "package"
. apply and save 
. Build now ---> .war package will get created

---- continous deployment -----
. to perform this task we need install "deploy to container" plugin
. manage jenkins -> manage plugins -> deploy to container plugin -> install without restart
. go to the smae  project -> post build actions -> deploy to war/ear -> 
  - provide file path "**/*.war"
  - provide any context name
  - mention tomcat url in the form http:// pvt-ip of server:8080 
                               "http://172.31.92.36:8080"
  - provide credentials which we add to tomcat user in qa server
. once deployed to QA browse using public-ip:8080 --publicip of qa server

--------- continous testing -------------------------------
. Create new project
.under build select execute shell and under it "(echo"test passed")"
--------------- continous deployment ----------------
. To perform deployment we need to archive artifacts which deployed to QA
. to perform this task we need to install "copy artifact" plugin
. once installed go to job which deployed artifacts to QA.
  under post build actions select archive artifact and provide path "**/*.war"
-->"to make test job to run after dev job -- go to dev job --> post build actions --> build other projects
   --> select test job"
. in the test job under build select copy artifacts from other project select dev job 
. in same job under post build action provide context path and select container tomcat 8.x 
  provide credentials and paste tomcat url of prod job 
Apply & Save
----------------------------------------------------------------------------------
Now run dev job once it succeeded then test job will TRIGGER

