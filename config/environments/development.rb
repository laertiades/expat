Expat::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.site = 'expat'

  config.action_mailer.smtp_settings = {
    :address              => ENV['LOCAL_ADDRESS'],
    :port                 => 25,
    :domain               => "goodfellowsites.com",
    :user_name            => ENV['LOCAL_USERNAME'],
    :password             => ENV['LOCAL_PASSWORD'],
    :authentication       => :login,
    :enable_starttls_auto => true,
    :openssl_verify_mode  => "none"
  }
  
  config.action_mailer.default_url_options = {
    :host => "goodfellowsites.com"
  }
  
  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => ENV['S3_BUCKET_NAME'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  }
=begin
  client = Dalli::Client.new('localhost:11211',
    :failover => true,
    :socket_timeout => 1.5,
    :socket_failure_delay => 0.2,
    :value_max_bytes => 10485760)
  config.action_dispatch.rack_cache = {
    :metastore        => client,
    :entitystore      => client
  }
  config.static_cache_control = "public, max-age=2592000"
=end
  config.middleware.use Mobvious::Manager
end
