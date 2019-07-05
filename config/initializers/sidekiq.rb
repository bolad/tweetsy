sidekiq_config = { url: "redis://localhost:6379/0" }

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
  # config.average_scheduled_poll_interval = 5 
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end

# sidekiq_log_level = ENV["SIDEKIQ_LOG_LEVEL"].presence || "WARN"
# Sidekiq::Logging.logger.level = Logger.const_get(sidekiq_log_level.upcase)
