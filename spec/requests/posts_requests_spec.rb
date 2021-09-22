# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:post1) { Feedjira::Parser::RSSEntry.new(title: 'Post #1 Title') }
  let(:post2) { Feedjira::Parser::RSSEntry.new(title: 'Post #2 Title') }

  describe 'GET #index' do
    before do
      allow(PostsAggregator).to receive(:run).and_return([post1, post2])

      get posts_path
    end

    it 'calls the PostsAggregator' do
      expect(PostsAggregator).to have_received(:run)
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response.body).to include(post1.title, post2.title)
    end
  end
end
