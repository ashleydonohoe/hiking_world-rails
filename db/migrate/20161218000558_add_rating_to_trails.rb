class AddRatingToTrails < ActiveRecord::Migration[5.0]
  def change
    add_column :trails, :rating, :integer
  end
end
