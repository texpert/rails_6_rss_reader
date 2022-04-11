# frozen_string_literal: true

# On Rails autoload is done by ActiveSupport from the `autoload_paths` - no need to require files
# require 'roda'
# require 'roda/plugins/json'
# require 'roda/plugins/static_routing'

module Rapi
  class Base < Roda
    plugin :json
    plugin :request_headers
    plugin :static_routing

    static_get '/healthcheck' do
      Rapi::HealthChecker.run
    end

    static_put '/lambda' do
      auth_result = Shrine::Attacher.lambda_authorize(request.headers, request.body.read)
      if !auth_result
        response.status = 403
        { 'Error' => 'Signature mismatch' }
      elsif auth_result.is_a?(Array)
        attacher = auth_result[0]
        if attacher.lambda_save(auth_result[1])
          { 'Result' => 'OK' }
        else
          response.status = 500
          { 'Error' => 'Backend record update error' }
        end
      else
        response.status = 500
        { 'Error' => 'Backend Lambda authorization error' }
      end
    end

    # route do |r|
    #   r.run AuthRoutes
    # end
  end
end
