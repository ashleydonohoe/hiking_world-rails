class AddDifficultyToTrails < ActiveRecord::Migration[5.0]
  def change
    add_column :trails, :difficulty, :string
  end
end
