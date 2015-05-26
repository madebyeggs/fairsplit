class RemoveHomepagetitleFromWork < ActiveRecord::Migration
  def up
    remove_column :works, :homepage_title, :string
  end

  def down
    add_column :works, :homepage_title, :string
  end
end
