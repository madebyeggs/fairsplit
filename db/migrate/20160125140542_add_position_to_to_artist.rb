class AddPositionToToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :position, :integer
  end
end
