# frozen_string_literal: true

require 'rails_helper'
require './spec/shared_examples/navbar'
require './spec/shared_examples/feeds_list_table'

RSpec.describe 'Home page', type: :feature do
  describe 'Layout' do
    describe 'table' do
      context 'when no feeds are defined yet' do
        let(:feed_list_number) { 0 }

        before { visit '/' }

        it_has_layout_elements 'navbar'
        it_has_layout_elements 'feeds list table'

        it 'has no pagination widget, and a `New Feed` link' do
          within('body .container') do
            expect(page).to have_link('New Feed', exact: true)
            expect(page).not_to have_css('.pagy-bootstrap-nav')
          end
        end
      end

      context 'when there a number of feeds defined, but less than Pagy::VARS[:items]' do
        let(:feeds_number) { rand(1..Pagy::VARS[:items]) }
        let(:feed_list_number) { feeds_number }
        let!(:feed_list) { create_list(:feed, feeds_number) } # rubocop:disable RSpec/LetSetup

        before do
          visit '/'
        end

        it_has_layout_elements 'navbar'
        it_has_layout_elements 'feeds list table'

        it 'has no pagination widget, and a `New Feed` link' do
          within('body .container') do
            expect(page).to have_link('New Feed', exact: true)
            expect(page).not_to have_css('.pagy-bootstrap-nav')
          end
        end
      end

      context 'when there a number of feeds defined, more than Pagy::VARS[:items]' do
        let(:feeds_number) { rand(Pagy::VARS[:items] + 1..Pagy::VARS[:items] + 5) }
        let(:feed_list_number) { Pagy::VARS[:items] }
        let!(:feed_list) { create_list(:feed, feeds_number) } # rubocop:disable RSpec/LetSetup

        before { visit '/' }

        it_has_layout_elements 'navbar'
        it_has_layout_elements 'feeds list table'

        it 'has a pagination widget, and a `New Feed` link' do
          within('body .container') do
            expect(page).to have_link('New Feed', exact: true)
            expect(page).to have_css('.pagy-bootstrap-nav')
          end
        end
      end
    end
  end
end
