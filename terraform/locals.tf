locals {
  has_domain       = var.domain != ""
  domain           = local.has_domain ? var.domain : random_pet.website.id
  regional_domain  = module.website.regional_domain_name
  website_filepath = "${path.module}/../website"

  common_tags = {
    Project   = "sergioteste-sre"
    Service   = "Static Website"
    CreatedAt = "2022-11-23"
  }
}