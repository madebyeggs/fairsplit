class RemoveHomepagetitleFromArtist < ActiveRecord::Migration
  def up
    remove_column :artists, :homepage_title, :string
  end

  def down
    add_column :artists, :homepage_title, :string
  end
end
