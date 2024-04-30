resource "time_sleep" "wait_for_kubernetes" {
  depends_on = [
    aws_eks_cluster.myeks
  ]
  create_duration = "20s"
}

resource "kubernetes_namespace" "prometheus" {
  depends_on = [aws_eks_node_group.my-nodes, time_sleep.wait_for_kubernetes]
  metadata {
    name = "prometheus"
  }
}