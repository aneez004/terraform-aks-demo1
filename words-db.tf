resource "kubernetes_deployment" "words-db-deploy" {
  metadata {
    name = "db"
    labels = {
      app = "words-db"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "words-db"
      }
    }

    template {
      metadata {
        labels = {
          app = "words-db"
        }
      }

      spec {
        container {
          image = "dockersamples/k8s-wordsmith-db"
          name  = "db"
          port {
            name = "db"
            container_port = "5432"
          }

          
          }
        }
      }
    }
  }


#### Kubernetes Service - words-db

resource "kubernetes_service" "words-db-svc" {
  metadata {
    name = "db"
  }
  spec {
    selector = {
      app = "words-db"
    }
    port {
      port        = 5432
      target_port = 5432
      name = "db"
    }

    cluster_ip = "None"
  }
}
