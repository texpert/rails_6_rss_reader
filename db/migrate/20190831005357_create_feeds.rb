class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :url, null: false

      t.timestamps

      t.index(:title, unique: true)
      t.index(:url, unique: true)
    end
  end
end
