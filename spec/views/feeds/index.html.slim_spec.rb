# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feeds/index', type: :view do
  include Pagy::Backend

  helper Pagy::Frontend

  before do
    Feed.create!(title: 'Title', url: 'http://www.example.com')
    Feed.create!(title: 'Title1', url: 'http://www.example1.com')
    assign(:feeds, pagy(Feed.all)[1])
    assign(:pagy, pagy(Feed.all)[0])
  end

  it 'renders a list of feeds' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 1
    assert_select 'tr>td', text: 'Title1'.to_s, count: 1
    assert_select 'tr>td', text: 'http://www.example.com'.to_s, count: 1
    assert_select 'tr>td', text: 'http://www.example1.com'.to_s, count: 1
  end
end
