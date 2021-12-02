output "loadbalancer_ip" {
  value = kubernetes_service.words-web-svc.status.0.load_balancer.0.ingress.0.ip
}