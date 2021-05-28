resource "kubernetes_deployment" "nginx" {
  metadata {
    name   = "nginx"
    labels = { app = "nginx" }
  }
  spec {
    replicas = 3
    selector { match_labels = { app = "nginx" } }
    template {
      metadata { labels = { app = "nginx" } }
      spec {
        container {
          image = "nginx"
          name  = "nginx"
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata { name = "nginx" }
  spec {
    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 80
    }
  }
}
