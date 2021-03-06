class Sound < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  before_save :create_unique_id
  # This method associates the attribute ":avatar" with a file attachment
  
    if Rails.env.development?
      has_attached_file :image, MAIN_PAPERCLIP_STORAGE_OPTS
    else
      has_attached_file :image,
      :convert_options => { :all => '-quality 92' },  
      styles: {main: '710x210>'},
      :storage => :s3,
      :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
      :bucket => 'fairsplit-images',
      :path => "sounds/images/:id_partition/:style/:filename"
    end
    
    if Rails.env.development?
      has_attached_file :grid_square_image, GRID_SQUARE_PAPERCLIP_STORAGE_OPTS
    else
      has_attached_file :grid_square_image,
      :convert_options => { :all => '-quality 92' },  
      styles: {main: '400x400>'},
      :storage => :s3,
      :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
      :bucket => 'fairsplit-images',
      :path => "sounds/grid_square_images/:id_partition/:style/:filename"
    end
    
    if Rails.env.development?
      has_attached_file :large_image, LARGE_PAPERCLIP_STORAGE_OPTS
    else
      has_attached_file :large_image,
      :convert_options => { :all => '-quality 92' }, 
      styles: {main: '710x400>'},
      :storage => :s3,
      :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
      :bucket => 'fairsplit-images',
      :path => "sounds/large_images/:id_partition/:style/:filename"
    end
    
    if Rails.env.development?
      has_attached_file :facebook_image, FACEBOOK_PAPERCLIP_STORAGE_OPTS
    else
      has_attached_file :facebook_image,
      styles: {main: '1200x630>'},
      :convert_options => { :all => '-quality 92' },
      :storage => :s3,
      :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
      :bucket => 'fairsplit-images',
      :path => "sounds/facebook_images/:id_partition/:style/:filename"
    end
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :large_image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :facebook_image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :grid_square_image, :content_type => /\Aimage\/.*\Z/
    
    def create_unique_id
      self.is_artist = false
      self.is_work = false
      self.is_sound = true
      self.is_announcement = false
      if self.latest == true
        self.class.where("id != ?", self.id).update_all("latest = 'false'")
      end
    end
    
    def self.common_order
      order("latest DESC, id DESC")
    end
    
    def self.homepage
      where(:homepage => true)
    end
end