# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feed do
  it { is_expected.to have_db_column(:title) }
  it { is_expected.to have_db_column(:url).with_options(null: false) }

  it { is_expected.to have_db_index(:title).unique(true) }
  it { is_expected.to have_db_index(:url).unique(true) }

  it { is_expected.to have_readonly_attribute(:title) }

  context 'when validations' do
    subject(:feed) { build(:feed) }

    it { is_expected.to validate_presence_of(:url) }

    it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:url).case_insensitive }

    it 'validates url format' do
      feed.url = 'invalid url'

      expect(feed).not_to be_valid
    end
  end
end
