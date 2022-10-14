# frozen_string_literal: true

Rails.application.config.generators do |g|
  g.test_framework :rspec, views: false
  g.orm :active_record, primary_key_type: :uuid
end
