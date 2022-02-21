# frozen_string_literal: true

Rails.application.config.session_store :cookie_store,
                                       key:        "_#{Rails.env}_rails_6_rss_reader_secure_session",
                                       domain:     NGROK_ENABLED ? NGROK_URL.delete_prefix('https://') : :all,
                                       tld_length: 2
