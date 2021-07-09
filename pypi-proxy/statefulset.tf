resource "kubernetes_stateful_set" "devpi" {
  metadata {
    name = "devpi"
    namespace = kubernetes_namespace.namespace.metadata[0].name
    labels = {
      app = "devpi"
      stack = "kubernetes"
    }
  }

  spec {
    replicas = local.values.replicas
    revision_history_limit = local.values.history_limit
    selector {
      match_labels = {
        app = "devpi"
        stack = "kubernetes"
      }
    }
    service_name = "devpi"
    template {
      metadata {
        labels = {
          app = "devpi"
          stack = "kubernetes"
        }
      }
      spec {
        container {
          name = "devpi"
          image = "eu.gcr.io/zorglub/devpi:latest"
          image_pull_policy = "Always"
          port {
            container_port = 80
            name = "http"
            protocol = "TCP"
          }
          volume_mount {
            name = "devpi-storage"
            mount_path = "/devpi"
            sub_path = ""
          }
          liveness_probe {
            failure_threshold = 5
            http_get {
              path = "/"
              port = "http"
              scheme = "HTTP"
            }
            initial_delay_seconds = 15
            period_seconds = 10
            success_threshold = 1
            timeout_seconds = 2
          }
          readiness_probe {
            failure_threshold = 5
            http_get {
              path = "/"
              port = "http"
              scheme = "HTTP"
            }
            initial_delay_seconds = 15
            period_seconds = 10
            success_threshold = 1
            timeout_seconds = 2
          }
        }
        termination_grace_period_seconds = 300
        image_pull_secrets {
          name = kubernetes_secret.docker-registry.metadata[0].name
        }
      }
    }
    update_strategy {
      type = "RollingUpdate"
      rolling_update {
        partition = 1
      }
    }
    volume_claim_template {
      metadata {
        name = "devpi-storage"
      }
      spec {
        access_modes = [
          "ReadWriteOnce"]
        storage_class_name = local.values.storage.class

        resources {
          requests = {
            storage = local.values.storage.size
          }
        }
      }
    }
  }
  depends_on = [
    kubernetes_secret.docker-registry
  ]
}