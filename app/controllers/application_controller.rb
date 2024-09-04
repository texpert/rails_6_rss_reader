# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :n_plus_one_detection, unless: Rails.env.production?

  def n_plus_one_detection
    Prosopite.scan
    yield
  ensure
    Prosopite.finish
  end
end
