Kubectl installation 
#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
Download the kubectl checksum file:
#curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
Validate the kubectl binary against the checksum file:
#echo "$(<kubectl.sha256)  kubectl" | sha256sum --check
Install kubectl
#sudo install -o root -g root -m 0755 kubectl /bin/kubectl
Test to ensure the version you installed is up-to-date
#kubectl version --client
Kops installtion 
#curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
Make the kops binary executable
#chmod +x kops-linux-amd64
Move the kops binary in to your PATH.
#sudo mv kops-linux-amd64 /bin/kops

Step2::::::Create a route53 domain for your cluster
go to route53 serves > create hosted zone 
domain name = vijay-aws.tk 
Create an S3 bucket to store your clusters state 
#aws s3 mb s3://vijay-aws1.tk
#export KOPS_STATE_STORE=s3://vijay-aws1.tk
Create the cluster in AWS
#kops create cluster --cloud=aws --zones=ap-south-1b --name=vijay-aws1.tk --dns-zone=vijay-aws.tk --dns public
Final creation of kops cluster 
#kops update cluster --name vijay-aws1.tk --yes --admin

