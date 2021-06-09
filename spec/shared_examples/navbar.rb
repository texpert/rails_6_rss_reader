# frozen_string_literal: true

RSpec.shared_examples 'navbar' do
  it 'has certain links' do
    expect(page).to have_title('Rails6RssReader')
    within('body .navbar .container-fluid .navbar-nav-scroll .navbar-nav') do
      expect(page).to have_link('Feeds', exact: true)
      expect(page).to have_link('Posts', exact: true)
    end
  end
end
