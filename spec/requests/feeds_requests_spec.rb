# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Feeds', type: :request do
  let!(:feed1) { create :feed, title: 'Feed #1' }
  let!(:feed2) { create :feed, title: 'Feed #2' }

  describe 'GET #index' do
    before do
      get feeds_path
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response.body).to include(feed1.title, feed1.url, feed2.title, feed2.url)
    end
  end
end
