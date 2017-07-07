class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :category_id
      t.string :video_url
      t.string :composer
      t.boolean :is_active, default: true, null: false

      t.timestamps null: false
    end
    add_index :videos, :category_id
  end
end
