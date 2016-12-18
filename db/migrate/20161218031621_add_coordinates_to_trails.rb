class AddCoordinatesToTrails < ActiveRecord::Migration[5.0]
  def change
    add_column :trails, :latitude, :decimal
    add_column :trails, :longitude, :decimal
  end
end
