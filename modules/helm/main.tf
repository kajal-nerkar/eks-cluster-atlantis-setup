resource "kubernetes_namespace" "atlantis" {
  metadata {
    name = "atlantis"
  }
}

resource "helm_release" "atlantis" {
  name       = "atlantis"
  chart      = "atlantis"
  repository = "https://helm.releases.hashicorp.com"
  namespace  = kubernetes_namespace.atlantis.metadata[0].name
  version    = "3.15.0"  # Use the latest stable version

  values = [
    file("values.yaml")
  ]
}

# Create a values.yaml file dynamically
resource "local_file" "atlantis_values" {
  filename = "${path.module}/values.yaml"
  content  = templatefile("${path.module}/values.tmpl.yaml", {
    github_token     = var.github_token
    github_repo_owner = var.github_repo_owner
    github_repo_name = var.github_repo_name
  })
}
