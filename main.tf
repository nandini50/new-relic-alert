
 
# # Define a New Relic Browser Monitor
# resource "newrelic_browser_application" "example_browser_app" {
#   name = "browserapp1"
# }
 
# Create an alert policy
resource "newrelic_alert_policy" "example_policy" {
  name = "Example Alert Policy"
}
 
# Create an NRQL alert condition for browser application events
resource "newrelic_nrql_alert_condition" "high_js_errors" {
  policy_id = newrelic_alert_policy.example_policy.id
  name      = "High JavaScript Errors"
#   term {
#     duration      = "5"
#     operator      = "above"
#     priority      = "critical"
#     threshold     = "50"
#     time_function = "all"
#   }
   account_id                     = 4440025
#   policy_id                      = newrelic_alert_policy.foo.id
  type                           = "static"
#   name                           = "foo"
  description                    = "Alert when transactions are taking too long"
  runbook_url                    = "https://www.example.com"
  enabled                        = true
  violation_time_limit_seconds   = 3600
  fill_option                    = "static"
  fill_value                     = 1.0
  aggregation_window             = 60
  aggregation_method             = "event_flow"
  aggregation_delay              = 120
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30
  nrql {
    query       = "SELECT count(*) FROM JavaScriptError WHERE appName = 'browserapp'"
    # since_value = ""
  }

    critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = 3.5
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}
 

 
resource "newrelic_notification_destination" "team_email_destination" {
  name = "email-example"
  type = "EMAIL"
  account_id = 4440025  
  property {
    key = "email"
    value = "architamoudgills@gmail.com"
  }
}
