locals {
  messaging = merge(
    var.messaging,
    {
      servicebus_namespaces = var.servicebus_namespaces
      servicebus_topics     = var.servicebus_topics
      servicebus_queues     = var.servicebus_queues
      signalr_services      = var.signalr_services
    }
  )
}