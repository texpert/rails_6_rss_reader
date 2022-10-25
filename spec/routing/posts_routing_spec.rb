# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for Posts' do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/posts').to route_to('posts#index')
    end
  end
end
