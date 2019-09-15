# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feeds/edit', type: :view do
  let!(:feed) { assign(:feed, Feed.create!(title: 'ExampleFeed', url: 'http://www.example.com')) }

  it 'renders the edit feed form' do
    render

    assert_select 'form[action=?][method=?]', feed_path(feed), 'post' do
      assert_select 'input[name=?]', 'feed[url]'
    end
  end
end
