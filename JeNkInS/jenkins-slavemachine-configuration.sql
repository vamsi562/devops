---------------- SLAVE MACHINE CONFIGURATION ---------------
If more no of jobs running on the dev server there is possibility of server down.
.To reduce load on main dev server(main machine), we create a new machine(slave machine)

------------------ SLAVE MACHINE ------------------------ 
. It is nothing but an ec2 INSTANCE
. We install same java runtime which is installed on main machine
. once java installed we need establish passwordless communication between main machine and slave machine

----------------------- Steps --------------------------
. Create a new EC2 instance with UBUNTU 18.04 image same as Main machine
. Connect to that slave machine
. run below commands /*

    - "sudo apt-get update" --. update packages
    - "sudo apt install openjdk-8-jdk -y" --> install java run time
    - "sudo passwd ubuntu" --> as we logged in without passwd set password
    - "cd /etc/ssh" --> we will move into ssh directory
    - "sudo vim sshd_config" --> in this file change password authentication to "yes"
    - "sudo service ssh restart" --> it will restart ssh service
  */
. connect to master/machine server, we need to connect to slave from here
  we use the pvt of ip of slave machine to connect from main server
       "ssh ubuntu@pvt-ip(slave machine)"
  - after running this command it will ask for password of slave machine
  - to bypass password we need to generate keys in master machine
     connect to master machine
	 - "ssh-keygen" --> generate keys
	 - "ssh-copy-id ubuntu@pvtip-of-slavemachine" -- it will copy keys from master to slave machine
	 - "ssh ubuntu@pvtip-of-slavemachine" -- we will be able to connect to slave machine without PASSWORD
	 
. We need to slave.jar file in slave machine
  - when we install jenkins by default slave.jar file will be available i.e in master machine
  - this file should be copied to slave machine
  - slave.jar file will be available in the jnlpjars/slave.jar
    -" sudo wget http://pvtipofmastermachine:8080/jnlpjars/slave.jar "
  - once the slave.jar file downloaded into slave machine chnage owner permissions
    - update execute permission to owner 
	    " sudo u+x slave.jar "
  - in slave machine create empty DIRECTORY
     " mkdir vamsi"
	  "cd vamsi"
	  "pwd" --> copy path of directory (/home/ubuntu/vamsi)
	 
. We need to create a new node in jenkins
  - manage jenkins > manage nodes (default node: master)> create a new node
    > provide name > mark it as permenant agent > remote root directory(/home/ubuntu/vamsi) > 
      provide label name > launch method(launch agent via execution of cmd on controller)
    > under launch cmd ( "ssh ubuntu@pvt-ip-slavemachine java -jar slave.jar")
. new node gets created	

----------------- how to use slave node --------------
. while creating new job > restrict where this project can be run 
  > mention label which we created earlier (label refers to node)