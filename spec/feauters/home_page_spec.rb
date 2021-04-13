# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  describe 'Layout' do
    describe 'navbar' do
      before { visit '/' }

      it 'has certain links' do
        expect(page).to have_title('Rails6RssReader')
        within('body .container .navbar .navbar-nav-scroll .navbar-nav') do
          expect(page).to have_link('Feeds', exact: true)
          expect(page).to have_link('Posts', exact: true)
        end
      end
    end

    describe 'table' do
      context 'when no feeds are defined yet' do
        before { visit '/' }

        it 'has only headers, no rows, no pagination widget, and a `New Feed` link' do
          within('body .container') do
            expect(find('table caption').text).to eql('Feeds List')
            expect(page).to have_css('table thead tr th') do |headers|
              headers.map(&:text) == %w[Title Url]
            end
            expect(page).to have_css('tbody tr', count: 0)
            expect(page).to have_link('New Feed', exact: true)
            expect(page).not_to have_css('.pagy-bootstrap-nav')
          end
        end
      end

      context 'when there a number of feeds defined, but less than Pagy::VARS[:items]' do
        let(:feeds_number) { rand(1..Pagy::VARS[:items]) }
        let!(:feed_list) { create_list(:feed, feeds_number) } # rubocop:disable RSpec/LetSetup

        before { visit '/' }

        it 'has headers, feeds list rows, no pagination widget, and a `New Feed` link' do
          within('body .container') do
            expect(find('table caption').text).to eql('Feeds List')
            expect(page).to have_css('table thead tr th') do |headers|
              headers.map(&:text) == %w[Title Url]
            end
            expect(page).to have_css('tbody tr', count: feeds_number)
            expect(page).to have_link('New Feed', exact: true)
            expect(page).not_to have_css('.pagy-bootstrap-nav')
          end
        end
      end

      context 'when there a number of feeds defined, more than Pagy::VARS[:items]' do
        let(:feeds_number) { rand(Pagy::VARS[:items] + 1..Pagy::VARS[:items] + 5) }
        let!(:feed_list) { create_list(:feed, feeds_number) } # rubocop:disable RSpec/LetSetup

        before { visit '/' }

        it 'has headers, feeds list rows qty equal to Pagy::VARS[:items], pagination widget, and a `New Feed` link' do
          within('body .container') do
            expect(find('table caption').text).to eql('Feeds List')
            expect(page).to have_css('table thead tr th') do |headers|
              headers.map(&:text) == %w[Title Url]
            end
            expect(page).to have_css('tbody tr', count: Pagy::VARS[:items])
            expect(page).to have_link('New Feed', exact: true)
            expect(page).to have_css('.pagy-bootstrap-nav')
          end
        end
      end
    end
  end
end
