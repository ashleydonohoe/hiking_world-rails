class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.string :video_url
      t.string :video_title
      t.text :video_description
    end
    add_index :videos, :user_id
  end
end
