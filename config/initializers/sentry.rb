# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://477e43cc6bcc2af828bf8bc0fa9017f9@o4507101434806272.ingest.de.sentry.io/4507101436969040'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |_context|
    true
  end
  # Set profiles_sample_rate to profile 100%
  # of sampled transactions.
  # We recommend adjusting this value in production.
  config.profiles_sample_rate = 1.0
end
