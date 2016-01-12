class AddImageToSocialscont < ActiveRecord::Migration
  def self.up
    add_attachment :socialsconts, :announcements_image
    add_attachment :socialsconts, :works_image
    add_attachment :socialsconts, :artists_image
    add_attachment :socialsconts, :playlists_image
    add_attachment :socialsconts, :abouts_image
    add_attachment :socialsconts, :contacts_image
  end

  def self.down
    remove_attachment :socialsconts, :announcements_image
    remove_attachment :socialsconts, :works_image
    remove_attachment :socialsconts, :artists_image
    remove_attachment :socialsconts, :playlists_image
    remove_attachment :socialsconts, :abouts_image
    remove_attachment :socialsconts, :contacts_image
  end
end