data "aws_eks_cluster" "mycluster" {
  name = "mydemo"
}

resource "aws_eks_addon" "addons" {
  for_each          = { for addon in var.addons : addon.name => addon }
  cluster_name      = data.aws_eks_cluster.mycluster.id
  addon_name        = each.value.name
  addon_version     = each.value.version
  resolve_conflicts = "OVERWRITE"
}