class ChangeLatestToDefaultForArtist < ActiveRecord::Migration
  def change
    change_column :artists, :latest, :boolean, null: false, default: false
  end
end