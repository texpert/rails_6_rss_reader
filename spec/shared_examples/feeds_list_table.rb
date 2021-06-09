# frozen_string_literal: true

RSpec.shared_examples 'feeds list table' do
  it 'with caption and headers' do
    within('body') do
      within('table') do
        expect(find('caption').text).to eql('Feeds List')
        expect(page).to have_css('thead tr th') do |headers|
          headers.map(&:text) == %w[Title Url]
        end
        within('tbody') do
          expect(page).to have_css('tr', count: feed_list_number)
        end
      end
    end
  end
end
