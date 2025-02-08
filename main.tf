resource "google_project_service" "cert-manager" {
  service                    = "certificatemanager.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_certificate_manager_certificate_map" "this" {
  name        = local.resource_name
  labels      = local.labels
  description = "${local.block_name}: Created by Nullstone"

  depends_on = [google_project_service.cert-manager]
}

locals {
  certificate_map_id   = google_certificate_manager_certificate_map.this.id
  certificate_map_name = google_certificate_manager_certificate_map.this.name
}
