require 'rails_helper'

RSpec.describe "feeds/index", type: :view do
  before(:each) do
    assign(:feeds, [
      Feed.create!(
        :title => "Title",
        :url => "Url"
      ),
      Feed.create!(
        :title => "Title",
        :url => "Url"
      )
    ])
  end

  it "renders a list of feeds" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
