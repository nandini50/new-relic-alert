
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.38.1"
    }
  }
}
provider "newrelic" {
  account_id = 4440025                        
  api_key    = "NRAK-0K6QN0WO4PYUA84UXZNI7K2XWUK" 
  region = "US"
}
 
