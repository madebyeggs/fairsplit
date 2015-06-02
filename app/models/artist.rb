class Artist < ActiveRecord::Base
  attr_accessible :name, :description, :soundcloud, :image, :square_image, :latest, :large_image, :homepage_title, :vimeo, :uid, 
  :is_artist, :is_work, :is_sound, :is_announcement, :short_id_url, :short_uid_url, :homepage
  
  has_many :works
  before_save :create_unique_id
  
  require 'bitly'
  
    has_attached_file :image, ARTIST_MAIN_PAPERCLIP_STORAGE_OPTS
    has_attached_file :square_image, ARTIST_SQUARE_PAPERCLIP_STORAGE_OPTS
    has_attached_file :large_image, ARTIST_LARGE_PAPERCLIP_STORAGE_OPTS

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :square_image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :large_image, :content_type => /\Aimage\/.*\Z/
    
    def create_unique_id
      uid = rand.to_s[2..16]
      if self.uid == '' || self.uid.blank?
        self.uid = uid
      end
      self.is_artist = true
      self.is_work = false
      self.is_sound = false
      self.is_announcement = false
      if self.latest == true
        self.class.where("id != ?", self.id).update_all("latest = 'false'")
      end
    end
    
end