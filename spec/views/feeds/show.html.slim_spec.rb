# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feeds/show', type: :view do
  before do
    @feed = assign(:feed, Feed.create!(title: 'Feed Title', url: 'http://www.example.com'))
  end

  it 'renders attributes in <p>' do
    render

    assert_select '.col-1', 'Title:'
    assert_select '.col-1', 'Url:'
    assert_select '.col-11', 'Feed Title'
    assert_select '.col-11', 'http://www.example.com'
  end
end
