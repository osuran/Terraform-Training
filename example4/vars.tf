variable "AWS_ACCESS_KEY"{}
variable "AWS_SECRET_KEY"{}
variable "AWS_REGION"{
    default = "ap-southeast-1"
}

variable "AMIs"{
    type = map(string)
    default = {
        ap-southeast-1 = "ami-04ddf30efb5385f93"
        ap-southeast-2 = "ami-04ddf30efb5385f92"
    }
}