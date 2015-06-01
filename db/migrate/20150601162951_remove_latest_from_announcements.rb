class RemoveLatestFromAnnouncements < ActiveRecord::Migration
  def up
    remove_column :announcements, :latest, :boolean
  end

  def down
    add_column :announcements, :latest, :boolean
  end
end
