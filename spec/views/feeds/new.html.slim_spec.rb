# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feeds/new' do
  before do
    assign(:feed, Feed.new(title: 'MyString', url: 'MyString'))
  end

  it 'renders new feed form' do
    render

    assert_select 'form[action=?][method=?]', feeds_path, 'post' do
      assert_select 'input[name=?]', 'feed[url]'
    end
  end
end
