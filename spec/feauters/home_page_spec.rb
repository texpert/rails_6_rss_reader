# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  describe 'Layout' do
    describe 'navbar' do
      before { visit '/' }

      it 'has certain links' do
        expect(page).to have_title('Rails6RssReader')
        within(:xpath, './/body') do
          within('.container') do
            within('.navbar') do
              within('.navbar-nav-scroll') do
                within('.navbar-nav') do
                  find_link('Feeds', visible: :all).visible?
                  find_link('Posts', visible: :all).visible?
                end
              end
            end
          end
        end
      end
    end

    describe 'table' do
      context 'when no feeds are defined yet' do
        before { visit '/' }

        it 'has only headers, no rows, no pagination widget, and a `New Feed` link' do
          within(:xpath, './/body') do
            within('.container') do
              expect(find(:xpath, './/table/caption').text).to eql('Feeds List')
              within(:xpath, './/table/thead/tr') do
                headers = find(:xpath, '.').all('th').map(&:text)
                expect(headers[0]).to eql('Title')
                expect(headers[1]).to eql('Url')
              end
              within(:xpath, './/table/tbody') do
                table_rows = find(:xpath, '.').all('tr')
                expect(table_rows.size).to be(0)
              end
              find_link('New Feed', exact: true)
              expect(has_css?('.pagy-bootstrap-nav')).to be_falsey
            end
          end
        end
      end

      context 'when there a number of feeds defined, but less than Pagy::VARS[:items]' do
        let(:feeds_number) { rand(1..Pagy::VARS[:items]) }
        let!(:feed_list) { create_list(:feed, feeds_number) } # rubocop:disable RSpec/LetSetup

        before { visit '/' }

        it 'has headers, feeds list rows, no pagination widget, and a `New Feed` link' do
          within(:xpath, './/body') do
            within('.container') do
              expect(find(:xpath, './/table/caption').text).to eql('Feeds List')
              within(:xpath, './/table/thead/tr') do
                headers = find(:xpath, '.').all('th').map(&:text)
                expect(headers[0]).to eql('Title')
                expect(headers[1]).to eql('Url')
              end
              within(:xpath, './/table/tbody') do
                table_rows = find(:xpath, '.').all('tr')
                expect(table_rows.size).to eql(feeds_number)
              end
              find_link('New Feed', exact: true)
              expect(has_css?('.pagy-bootstrap-nav')).to be_falsey
            end
          end
        end
      end

      context 'when there a number of feeds defined, more than Pagy::VARS[:items]' do
        let(:feeds_number) { rand(Pagy::VARS[:items] + 1..Pagy::VARS[:items] + 5) }
        let!(:feed_list) { create_list(:feed, feeds_number) } # rubocop:disable RSpec/LetSetup

        before { visit '/' }

        it 'has headers, feeds list rows qty equal to Pagy::VARS[:items], pagination widget, and a `New Feed` link' do
          within(:xpath, './/body') do
            within('.container') do
              expect(find(:xpath, './/table/caption').text).to eql('Feeds List')
              within(:xpath, './/table/thead/tr') do
                headers = find(:xpath, '.').all('th').map(&:text)
                expect(headers[0]).to eql('Title')
                expect(headers[1]).to eql('Url')
              end
              within(:xpath, './/table/tbody') do
                table_rows = find(:xpath, '.').all('tr')
                expect(table_rows.size).to eql(Pagy::VARS[:items])
              end
              find_link('New Feed', exact: true)
              find_css('.pagy-bootstrap-nav')
              expect(has_css?('.pagy-bootstrap-nav')).to be_truthy
            end
          end
        end
      end
    end
  end
end
