class RemovePostingFromWorks < ActiveRecord::Migration
  def up
    remove_column :works, :short_uid_url
  end

  def down
    add_column :works, :short_uid_url, :string
  end
end
