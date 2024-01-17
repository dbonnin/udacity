ssh-keygen -t rsa -b 2048 -C "diego.bonnin@gmail.com" -f bastion_key
aws ec2 import-key-pair --key-name bastionKey --public-key-material file://./bastion_key_b64.txt --profile udacity