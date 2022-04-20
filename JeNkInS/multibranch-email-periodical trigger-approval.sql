------------- MULTI BRANCH PIPELINE -----------------------
. Developer creates multiple branches for different functionalities.
. Each branch has its own specific code
. along with code they also creates jenkins FILE
. jenkins file will contain stages of CI/CD that should be performed on that branch
. we need to create jenkins which work on these branches parallely and execute steps present in different jenkins files

------------- DEVELOPER ACTIVITY ---------------
. cloning repository
  - "git clone url"
. remove .git FILE
. "git add ."
. "(git commit -m "a")"

- creating child branch
. git branch child
.git checkout child
. git add .
git commit -m "b"

-create a github repository
. push both branches into it
  "git push -u --all github url"

Now we can see two branches in github

------------- DEVOPS ACTIVITY -------------------
. create a new project > select multi branch
. branch sources
  - git > paste github url
. enable scan multi-project TRIGGERS
  - select specified interval --- this makes jenkins job to scan branches for changes,
                                -- if present it will trigger pipeline automaticaly
-----------------EMAIL INTEGRATION -----------------------------

. if a job fails info need to pass on to corresponding dev team by an email
. manage jenkins > config system > smtp > config details

. create job > freestyle project > post-build actions > email notification
  provide mail-ID

-----------------------trigger Periodically -----------------------
. we can trigger periodically
  - we use cron job format
  - we need to give 5 VALUES
    -Min  -   0-59
    -hour -   0-23
    -dom  -   1-31 (day of month)
    -month -  1-12
    -dow -    0-6 (day of week)
. to run job every day at 9:30
  30 21 * * *
. to run job every day at 9:30 mon-fri
  30 21 * * 1-5
under  build trigger > build periodically

---------- making job wait for approval -----------
only possible for pipeline job

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
 }

. once continous download is done continous build need to wait for approval 
 - this can be done using 
   pipeline syntax > input:wait for interactive input
    node('built-in')
    {
     stage('continous download') 
      {
       git 'https://github.com/sunildevops77/maven.git'
      } 
     stage('continous build') 
      {
      input 'Pipeline has paused and needs your input before proceeding'
      sh 'mvn package'
      } 
    }