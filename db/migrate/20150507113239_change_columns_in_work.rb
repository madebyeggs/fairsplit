class ChangeColumnsInWork < ActiveRecord::Migration
  def up
    remove_attachment :works, :square_image
    remove_column :works, :soundcloud
  end

  def down
    add_attachment :works, :square_image
    add_column :works, :soundcloud
  end
end
