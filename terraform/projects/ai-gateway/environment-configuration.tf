locals {
  environment_configurations = {
    development = {
      oidc_issuer = "https://oidc.eks.eu-west-2.amazonaws.com/id/6DEB8DAAB19F7A5C9762F063B663954A"
    }
    production = {
      oidc_issuer = "https://oidc.eks.eu-west-2.amazonaws.com/id/FC55ADCAEC4333E590B10936490923E0"
    }
  }
}
