# frozen_string_literal: true

RSpec.shared_examples 'feeds list table' do
  it 'with caption and headers' do
    within('body') do
      within('table') do
        expect(find('caption').text).to eql('Feeds List')

        headers = page.all('th').map(&:text)
        expect(headers.reject(&:empty?)).to eql(%w[Title Url])

        within('tbody') do
          expect(page).to have_css('tr', count: feed_list_number)
        end
      end
    end
  end
end
