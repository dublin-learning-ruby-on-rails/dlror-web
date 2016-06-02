Delayed::Worker.queue_attributes = {
  high_priority: { priority: -10 },
  default: { priority: 0 },
  mailer: { priority: 1 },
  low_priority: { priority: 10 }
}