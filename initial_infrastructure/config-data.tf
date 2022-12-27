data "template_cloudinit_config" "prometheus_data" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "create-folder.sh"
    content_type = "text/x-shellscript"
    content      = templatefile("config-scripts/create-folder.sh",{
        folder_name = "prometheus"
    })
  }

  part {
    filename     = "docker-install.sh"
    content_type = "text/x-shellscript"
    content      = file("config-scripts/docker-install.sh")
  }

  part {
    filename     = "prometheus-config.sh"
    content_type = "text/x-shellscript"
    content      = file("config-scripts/prometheus-config.sh")
  }

  part {
    filename     = "prometheus-provier.sh"
    content_type = "text/x-shellscript"
    content      = file("config-scripts/prometheus-provider.sh")
  }

  
}

data "template_cloudinit_config" "grafana_data" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "create-folder.sh"
    content_type = "text/x-shellscript"
    content      = templatefile("config-scripts/create-folder.sh",{
        folder_name = "grafana"
    })
  }

  part {
    filename     = "docker-install.sh"
    content_type = "text/x-shellscript"
    content      = file("config-scripts/docker-install.sh")
  }

  part {
    filename     = "grafana-provier.sh"
    content_type = "text/x-shellscript"
    content      = file("config-scripts/grafana-provider.sh")
  }

  
}

data "template_cloudinit_config" "node_data" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "create-folder.sh"
    content_type = "text/x-shellscript"
    content      = templatefile("config-scripts/create-folder.sh",{
        folder_name = "node"
    })
  }

  part {
    filename     = "docker-install.sh"
    content_type = "text/x-shellscript"
    content      = file("config-scripts/docker-install.sh")
  }

  part {
    filename     = "grafana-provier.sh"
    content_type = "text/x-shellscript"
    content      = file("config-scripts/node-exporter-provider.sh")
  }

  
}