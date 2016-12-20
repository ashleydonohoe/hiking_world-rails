class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.string :story_title
      t.string :story_image
      t.text :story_body
    end
    add_index :stories, :user_id
  end
end
