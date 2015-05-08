class Announcement < ActiveRecord::Base
  attr_accessible :homepage_title, :image, :vimeo, :description, :soundcloud, :large_image, :latest, :square_image, 
  :uid, :is_artist, :is_work, :is_sound, :is_announcement, :short_uid_url
  
  before_save :create_unique_id
  
  require 'bitly'
  
  # This method associates the attribute ":avatar" with a file attachment
    has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      main: '710x210>'
    }
    
    has_attached_file :large_image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      main: '710x400>'
    }
    
    has_attached_file :square_image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      main: '300x300>'
    }

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :large_image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :square_image, :content_type => /\Aimage\/.*\Z/
    
    def create_unique_id
      uid = rand.to_s[2..16]
      bitly = Bitly.new('madebyeggs','R_9c183444d0d0432080764669badaf26a')
		  uid_url = bitly.shorten("https://fairsplitmusic.com/#filter=.announcements/" + "announcement" + "#{uid}")
		  short_uid_url = uid_url.short_url
      if self.uid == '' || self.uid.blank?
        self.uid = uid
      end
      self.is_artist = false
      self.is_work = false
      self.is_sound = false
      self.is_announcement = true
      if self.latest == '' || self.latest.blank?
        self.latest = false
      end
      if self.latest == true
        self.class.where("id != ?", self.id).update_all("latest = 'false'")
      end
      if self.short_uid_url == '' || self.short_uid_url.blank?
			  self.short_uid_url = short_uid_url
			end
    end
    
end