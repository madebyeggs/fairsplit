class AddSquareimageToWork < ActiveRecord::Migration
  def self.up
    add_attachment :works, :square_image
  end

  def self.down
    remove_attachment :works, :square_image
  end
end
