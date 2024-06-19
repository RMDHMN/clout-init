## ACL management for the k8s control plane and its API
resource "aws_iam_role" "eks_cluster" {
  #required
  name = "eks-cluster-demo"
  # the policy that grants an entity the required permissions
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}
# attaching policy to an IAM role
resource "aws_iam_role_policy_attachment" "demo_amazon_eks_cluster_policy" {
  # required
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

#########
## K8S ##
#########
resource "aws_eks_cluster" "eks" {
  # required
  name     = "eks"
  role_arn = aws_iam_role.eks_cluster.arn
  # optionnal
  version = "1.24"
  # necessary config
  vpc_config {
    # define the API server endpoint private/public
    endpoint_private_access = false
    endpoint_public_access  = true
    # best practices : the cluster must be deployed in at least two AZ
    subnet_ids = [
      aws_subnet.private_one.id,
      aws_subnet.private_two.id,
      aws_subnet.public_one.id,
      aws_subnet.public_two.id
    ]
  }
  # logical dependency
  depends_on = [aws_iam_role_policy_attachment.demo_amazon_eks_cluster_policy]
}
