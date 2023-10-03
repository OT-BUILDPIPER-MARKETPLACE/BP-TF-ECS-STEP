cluster_name        = "myfojo"
env                 = "dev"
services_subnet_ids = ["subnet-001504c486a830662", "subnet-0c1aa133cfd284945"]
alb_subnets         = ["subnet-03a13dc1ed5324f20", "subnet-0c61e327e14c7e90c"]

backend_image       = "nginx:latest"
webapp_image        = "yeasy/simple-web:latest"
admin_image         = "nginx:latest"
foomill_image       = "yeasy/simple-web:latest"