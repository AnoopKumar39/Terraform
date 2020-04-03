# Terraform

alias G="git pull"
alias A="terraform init"
alias B="terraform plan"
alias C="terraform apply -var-file=student.tfvars -auto-approve"
alias D="terraform destroy -var-file=student.tfvars -auto-approve"
  name                 = "studentapp"
  username             = "student"
  password             = "student1"

terraform console to calculate cidr function
C -var GITUSER=AnoopKumar39 -var GITPASS=MYpass0077 -var DBNAME=studentapp -var DBUSER=student -var DBPASS=student1 