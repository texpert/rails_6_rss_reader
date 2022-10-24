# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feeds/index' do
  include Pagy::Backend

  helper Pagy::Frontend

  let!(:feed1) { create(:feed, title: 'Title') }
  let!(:feed2) { create(:feed, title: 'Title1') }

  before do
    assign(:feeds, pagy(Feed.all)[1])
    assign(:pagy, pagy(Feed.all)[0])
  end

  it 'renders a list of feeds' do
    render
    assert_select 'tr>td', text: 'Title', count: 1
    assert_select 'tr>td', text: 'Title1', count: 1
    assert_select 'tr>td', text: feed1.url, count: 1
    assert_select 'tr>td', text: feed2.url, count: 1
  end
end
