variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMI_ID" {
  default = "ami-0a4a70bd98c6d6441"
}

variable "MYAPP_SERVICE_ENABLE" {
  default = "0"
}

variable "MYAPP_VERSION" {
  default = "0"
}

variable "REPO_URL" {
  default = "302238252373.dkr.ecr.ap-south-1.amazonaws.com/myapp"
}
