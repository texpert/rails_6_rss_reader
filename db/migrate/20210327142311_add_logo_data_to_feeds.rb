class AddLogoDataToFeeds < ActiveRecord::Migration[6.1]
  def change
    add_column :feeds, :logo_data, :text
  end
end
