class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.string :image_url
      t.text :caption
    end
  end
end
