# resource "aws_eks_cluster" "myeks" {
#   name     = "myeks"
#   role_arn = aws_iam_role.eks-role.arn

#   version = "1.27"


#   vpc_config {
#     endpoint_public_access = true
#     subnet_ids = [
#       aws_subnet.public-us-west-2a.id,
#       aws_subnet.public-us-west-2b.id
#     ]
#   }
#   depends_on = [
#     aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
#     aws_iam_role.eks-role
#   ]

#   tags = {
#     Name = "myeks"
#   }
# }