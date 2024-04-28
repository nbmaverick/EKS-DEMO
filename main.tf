# EKS Cluster

resource "aws_eks_cluster" "myeks" {
  name     = "myeks"
  role_arn = aws_iam_role.eks-role.arn

  version = "1.27"


  vpc_config {
    endpoint_public_access = true
    subnet_ids = [
      aws_default_subnet.default_az1.id,
      aws_default_subnet.default_az2.id,
      aws_default_subnet.default_az3.id
    ]
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role.eks-role
  ]

  tags = {
    Name = "myeks"
  }
}

# EKS Node 

resource "aws_eks_node_group" "my-nodes" {
  cluster_name    = aws_eks_cluster.myeks.name
  node_group_name = "my-nodes"
  node_role_arn   = aws_iam_role.node-role.arn

  subnet_ids = [
      aws_default_subnet.default_az1.id,
      aws_default_subnet.default_az2.id,
      aws_default_subnet.default_az3.id
  ]

  version = "1.27"

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly
  ]

  tags = {
    Name = "my-nodes"
  }
}