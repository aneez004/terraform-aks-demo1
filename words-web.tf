resource "kubernetes_deployment" "words-web-deploy" {
  metadata {
    name = "web"
    labels = {
      app = "words-web"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "words-web"
      }
    }

    template {
      metadata {
        labels = {
          app = "words-web"
        }
      }

      spec {
        container {
          image = "dockersamples/k8s-wordsmith-web"
          name  = "web"
          port {
            name = "words-web"
            container_port = "80"
          }

          
          }
        }
      }
    }
  }


#### Kubernetes Service - words-web

resource "kubernetes_service" "words-web-svc" {
  metadata {
    name = "web"
  }
  spec {
    selector = {
      app = "words-web"
    }
    port {
      port        = 8081
      target_port = 80
      name = "words-web"
    }

    type = "LoadBalancer"
  }
}
