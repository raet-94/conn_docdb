ssh -i "ubuntu.pem" -L 27017:docdb-2020-07-28-00-51-15.cluster-cnulc0ybvaaq.us-west-2.docdb.amazonaws.com:27017 ubuntu@ec2-52-32-211-196.us-west-2.compute.amazonaws.com -N -o  ServerAliveInterval=120 ServerAliveCountMax=10

