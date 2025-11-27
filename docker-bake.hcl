group "default" {
  targets = ["service-a", "service-b", "service-c", "service-d", "service-e"]
}

target "service-a" {
  context = "service-a"
  dockerfile = "Dockerfile"
  tags = ["service-a:latest"]
}

target "service-b" {
  context = "service-b"
  dockerfile = "Dockerfile"
  tags = ["service-b:latest"]
}

target "service-c" {
  context = "service-c"
  dockerfile = "Dockerfile"
  tags = ["service-c:latest"]
}

target "service-d" {
  context = "service-d"
  dockerfile = "Dockerfile"
  tags = ["service-d:latest"]
}

target "service-e" {
  context = "service-e"
  dockerfile = "Dockerfile"
  tags = ["service-e:latest"]
}
