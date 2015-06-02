class Work < ActiveRecord::Base
  attr_accessible :title, :client, :description, :vimeo, :image, :large_image, :type_of_work, :artist_name, :track_name, 
  :latest, :artist_id, :homepage_title, :uid, :is_artist, :is_work, :is_sound, :is_announcement, :short_id_url, :short_uid_url, :homepage
  
  before_save :create_unique_id
  belongs_to :artist
  
  require 'bitly'
  
  # This method associates the attribute ":avatar" with a file attachment
    
    if Rails.env.development?
      has_attached_file :image, MAIN_PAPERCLIP_STORAGE_OPTS
    else
      has_attached_file :image, 
      styles: {main: '710x210>'},
      :storage => :s3,
      :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
      :bucket => 'fairsplit-images',
      :path => "works/images/:id_partition/:style/:filename"
    end
    
    if Rails.env.development?
      has_attached_file :large_image, LARGE_PAPERCLIP_STORAGE_OPTS
    else
      styles: {main: '710x400>'},
      :storage => :s3,
      :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
      :bucket => 'fairsplit-images',
      :path => "works/large_images/:id_partition/:style/:filename"
    end
    

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :large_image, :content_type => /\Aimage\/.*\Z/
    
    def create_unique_id
      uid = rand.to_s[2..16]
      if self.uid == '' || self.uid.blank?
        self.uid = uid
      end
      self.is_artist = false
      self.is_work = true
      self.is_sound = false
      self.is_announcement = false
      if self.latest == true
        self.class.where("id != ?", self.id).update_all("latest = 'false'")
      end
    end
end