resource "kubernetes_deployment" "words-api-deploy" {
  metadata {
    name = "words"
    labels = {
      app = "words-api"
    }
  }

  spec {
    replicas = 5

    selector {
      match_labels = {
        app = "words-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "words-api"
        }
      }

      spec {
        container {
          image = "dockersamples/k8s-wordsmith-api"
          name  = "words"
          port {
            name = "api"
            container_port = "8080"
          }

          
          }
        }
      }
    }
  }


#### Kubernetes Service - words-api

resource "kubernetes_service" "words-api-svc" {
  metadata {
    name = "words"
  }
  spec {
    selector = {
      app = "words-api"
    }
    port {
      port        = 8080
      target_port = 8080
      name = "api"
    }

    cluster_ip = "None"
  }
}
