# frozen_string_literal: true

require_relative 'boot'

# require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
# require "active_storage/engine"
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require "action_mailbox/engine"
# require "action_text/engine"
require 'action_view/railtie'
# require "action_cable/engine"
require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rails6RssReader
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.active_record.schema_format = :sql
    config.generators do |g|
      g.assets false
    end
    config.action_mailer.deliver_later_queue_name = :default
    # config.action_mailbox.queues.incineration = :default
    # config.action_mailbox.queues.routing = :default
    # config.active_storage.queues.analysis = :default
    # config.active_storage.queues.purge = :default

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

Oj.default_options = { mode: :custom, cache_keys: true, cache_str: 5 }
Oj.optimize_rails
