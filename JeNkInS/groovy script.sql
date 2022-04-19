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