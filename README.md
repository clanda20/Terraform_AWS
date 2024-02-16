# Terraform_AWS
Basic Setup.

1. In the terminal, use this, $ git clone https://github.com/clanda20/Terraform_AWS.git all the needed files are there.

2. Using your credentials login your AWS access portal URL: https://d-xxxxx.awsapps.com/start/

3. Once login  go click on "Command line or programming access" on the AdminstrarorAccess page and copy your credential.  Follow instructions there. 
4. Paste the credentials on your terminal.

5. Now back into the AdministrorAccess page and now click on "Management console"  that you will use later on. 


Creating UC2.

1. Go to the subdirectory with uc2 name. 
 -Very that the key_name in line 58 correspondes to your key_name that you have previously created on EC2 > Key Pairs.  
 -Verifiry your region, and change it accordingly on line 13.

2.  Initialize Terraform:  $ Terraform init
3.  Run: $ Terraform Plan  (Terraform used the selected providers to generate the execution plan) and you will be asked for your VPC ID  locaded in you AWS Console,   VPC > Your VPCs> vpc-xxxxxxxx.  Copy it and paste it in the terminal. 
4.  Run: $ Terraform Apply and again you will be asked for your VPC ID  locaded in you AWS Console,   VPC > Your VPCs> vpc-xxxxxxxx.  Copy it and paste it in the terminal
5.  Type in: "Yes"  when asked to approve the transaction : "  (Terraform  performs the actions described above. Only 'yes' will be accepted to approve.)`
6. You will see an output like this:

 "Apply complete! Resources: 5 added, 0 changed, 0 destroyed."

Outputs:

hostid = [
  "ec2-54-161-128-123.compute-1.amazonaws.com",
  "ec2-3-85-114-5.compute-1.amazonaws.com",
  "ec2-54-156-157-143.compute-1.amazonaws.com",
  "ec2-54-89-184-141.compute-1.amazonaws.com", ]

7. On you console go to EC2 > Instances.
8. Click on the instance ID on a running instance. 
9. Go to the Connect button on top of the page. 
10. Go to SSH client tap  and go to the example bellow and copy it. 
  ssh -i "/User/yourname/.ssh/testing_aws_key.pem" ubuntu@ec2-xx-xx-xx-x.compute-1.amazonaws.com
11. On your terminal paste it.
12. Connected
13. Once you finish terminate Terraform by typing, Terraform destroy. 
