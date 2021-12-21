variable "project13-vpc-cidr" {
   default = "10.0.0.0/16"
   description = "project13 vpc cidr block"
   type = string
  }

   variable "project13-pub-sub1-cidr" {
   default = "10.0.1.0/24"
   description = "project13-pub subnet1 cidr block"
   type = string
  }

  variable "project13-pub-sub2-cidr" {
   default = "10.0.2.0/24"
   description = "project13-pub subnet2 cidr block"
   type = string
  } 

  variable "project13-pub-sub3-cidr" {
   default = "10.0.3.0/24"
   description = "project13-pub subnet3 cidr block"
   type = string
  } 
  variable "project13-private-sub1-cidr" {
   default = "10.0.4.0/24"
   description = "project13-private subnet1 cidr block"
   type = string
  }

  variable "project13-private-sub2-cidr" {
   default = "10.0.5.0/24"
   description = "project13-private subnet2 cidr block"
   type = string
  }

  variable "project13-private-sub3-cidr" {
   default = "10.0.6.0/24"
   description = "project13-private subnet3 cidr block"
   type = string
  }

  variable "project13-ami" {
   default = "ami-0fc15d50d39e4503c"
   description = "project13-ami"
   type = string
  }

  variable "project13-region" {
   default = "eu-west-2"
   description = "project13-region"
   type = string
  }
