#comment
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

# 1. Add JavaScript code inside a local variable
locals {
  app_code = <<-EOT
    console.log("Hello from Terraform-generated Node.js app!");
  EOT
}

# 2. Create the index.js file inside webapp/src/
resource "local_file" "webapp_app" {
  content  = local.app_code
  filename = "${path.module}/webapp/src/index.js"
}

# 3. Output the file path after creation
output "webapp_file_path" {
  value       = resource.local_file.webapp_app.filename
  description = "The full path to the generated webapp index.js file."
}
