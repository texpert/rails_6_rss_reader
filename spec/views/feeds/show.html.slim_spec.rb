# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feeds/show', type: :view do
  let!(:feed1) { create :feed, title: 'Feed Title' }

  before do
    @feed = assign(:feed, feed1)
  end

  it 'renders attributes in <p>' do
    render

    assert_select '.col-1', 'Title:'
    assert_select '.col-1', 'Url:'
    assert_select '.col-11', feed1.title
    assert_select '.col-11', feed1.url
  end
end
