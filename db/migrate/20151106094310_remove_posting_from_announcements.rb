class RemovePostingFromAnnouncements < ActiveRecord::Migration
  def up
    remove_column :announcements, :short_uid_url
  end

  def down
    add_column :announcements, :short_uid_url, :string
  end
end
