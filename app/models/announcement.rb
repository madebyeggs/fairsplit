class Announcement < ActiveRecord::Base
  attr_accessible :homepage_title, :image, :vimeo, :description, :soundcloud, :large_image, :latest, :square_image, 
  :uid, :is_artist, :is_work, :is_sound, :is_announcement, :short_uid_url
  
  before_save :create_unique_id
  
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
      :path => "announcements/images/:id_partition/:style/:filename"
    end
    
    if Rails.env.development?
      has_attached_file :square_image, SQUARE_PAPERCLIP_STORAGE_OPTS
    else
      has_attached_file :square_image,
      styles: {main: '300x300>'},
      :storage => :s3,
      :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
      :bucket => 'fairsplit-images',
      :path => "announcements/square_images/:id_partition/:style/:filename"
    end
    
    if Rails.env.development?
      has_attached_file :large_image, LARGE_PAPERCLIP_STORAGE_OPTS
    else
      has_attached_file :large_image,
      styles: {main: '710x400>'},
      :storage => :s3,
      :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
      :bucket => 'fairsplit-images',
      :path => "announcements/large_images/:id_partition/:style/:filename"
    end

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :large_image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :square_image, :content_type => /\Aimage\/.*\Z/
    
    def create_unique_id
      uid = rand.to_s[2..16]
      if self.uid == '' || self.uid.blank?
        self.uid = uid
      end
      self.is_artist = false
      self.is_work = false
      self.is_sound = false
      self.is_announcement = true
      if self.short_uid_url == '' || self.short_uid_url.blank?
			  self.short_uid_url = short_uid_url
			end
    end
    
end