class Sound < ActiveRecord::Base
  attr_accessible :title, :description, :soundcloud, :image, :latest, :homepage_title, :square_image, :vimeo, :uid, 
  :is_artist, :is_work, :is_sound, :is_announcement, :large_image, :short_id_url, :short_uid_url
  
  before_save :create_unique_id
  
  require 'bitly'
  
  # This method associates the attribute ":avatar" with a file attachment
    has_attached_file :image,
    styles: {main: '710x210>'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
    :bucket => 'fairsplit-images',
    :path => "sounds/images/:id_partition/:style/:filename"
    
    has_attached_file :large_image,
    styles: {main: '710x400>'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
    :bucket => 'fairsplit-images',
    :path => "sounds/large_images/:id_partition/:style/:filename"

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :large_image, :content_type => /\Aimage\/.*\Z/
    
    def create_unique_id
      if self.new_record?
        #id = Sound.connection.select_value("Select nextval('sounds_id_seq')")
        id = Sound.maximum(:id) + 1
      else
        id = self.id
      end
      uid = rand.to_s[2..16]
      bitly = Bitly.new(ENV['BITLY_USER'],ENV['BITLY_PASS'])
		  id_url = bitly.shorten("https://fairsplitmusic.com/#filter=.playlists/" + "playlist" + "#{id}")
		  uid_url = bitly.shorten("https://fairsplitmusic.com/#filter=.playlists/" + "playlist" + "#{uid}")
		  short_id_url = id_url.short_url
		  short_uid_url = uid_url.short_url
      if self.uid == '' || self.uid.blank?
        self.uid = uid
      end
      self.is_artist = false
      self.is_work = false
      self.is_sound = true
      self.is_announcement = false
      if self.latest == '' || self.latest.blank?
        self.latest = false
      end
      if self.latest == true
        self.class.where("id != ?", self.id).update_all("latest = 'false'")
      end
      if self.short_id_url == '' || self.short_id_url.blank?
			  self.short_id_url = short_id_url
			end
			if self.short_uid_url == '' || self.short_uid_url.blank?
			  self.short_uid_url = short_uid_url
			end
    end
end