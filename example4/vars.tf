variable "AWS_ACCESS_KEY"{}
variable "AWS_SECRET_KEY"{}
variable "AWS_REGION"{
    default = "ap-northeast-2"
}

variable "AMIs"{
    type = map(string)
    default = {
        ap-northeast-1 = "ami-04ddf30efb5385f92"
        ap-northeast-2 = "ami-0a306845f8cfbd41a"
    }
}