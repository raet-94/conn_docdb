# Connection to a DocumentDB using an EC2 for a ssh tunnel 




To connect to a DocumentDB database outside from de VPC in which is created  , you need to create an EC2 instance in the same vpc this will be used to create a ssh tunnel to the DocumentDB.   


## -Ssh to EC2
First you need to  connect to the  EC2 instance and download the .pem for your DocumentDB instance for this you will need to type 

ssh -i "<Ec2.pem>" user@<PublicDNS(IPv4)>

and then type 

wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem



## -Tunnel

After that on the machine where you want to create you need to create an ssh tunnel 

ssh -i "<Ec2.pem>" -L 27017: <DocDB Cluster endpoint>:27017 user@<PublicDNS(IPv4)> -N 


## -Connection to  mongo 
Using the mongo shell the connection will be the next one 

mongo --sslAllowInvalidHostnames --ssl --sslCAFile <Docdb.pem> --username <db_user> --password <db_user_password>

## -Long ssh time connection 
If you want to create a ssh connetion that live longer you cann do that changing the ssh command  

ssh -i "<Ec2.pem>" -L 27017: <DocDB Cluster endpoint>:27017 user@<PublicDNS(IPv4)> -N  -o ServerAliveInterval=N -o ServerAliveCountMax=M

where N is the time in seconds after which if no data has been received from the server, ssh will send a message through the encrypted channel to request a response from the server, and M sets the number of server alive messages  which may be sent without ssh receiving any messages back from the server. If this threshold is reached while server alive messages are being sent, ssh will disconnect from the server, terminating the session.






## Sources 
For more detailed information please check

- https://aws.amazon.com/premiumsupport/knowledge-center/documentdb-cannot-connect/

For more details in your ssh connection 

- http://man.openbsd.org/ssh_config