class Work < ActiveRecord::Base
  attr_accessible :title, :client, :description, :vimeo, :image, :large_image, :type_of_work, :artist_name, :track_name, 
  :latest, :artist_id, :homepage_title, :uid, :is_artist, :is_work, :is_sound, :is_announcement, :short_id_url, :short_uid_url, :homepage
  
  before_save :create_unique_id
  belongs_to :artist
  
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
    :path => "works/images/:id_partition/:style/:filename"
    
    has_attached_file :large_image,
    styles: {main: '710x400>'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd2gtajjeesejrd.cloudfront.net', 
    :bucket => 'fairsplit-images',
    :path => "works/large_images/:id_partition/:style/:filename"
    

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :large_image, :content_type => /\Aimage\/.*\Z/
    
    def create_unique_id
      if self.new_record?
        #id = Work.connection.select_value("Select nextval('works_id_seq')")
        id = Work.maximum(:id) + 1
      else
        id = self.id
      end
      uid = rand.to_s[2..16]
      bitly = Bitly.new(ENV['BITLY_USER'],ENV['BITLY_PASS'])
		  id_url = bitly.shorten("https://fairsplitmusic.com/#filter=.works/" + "work" + "#{id}")
		  uid_url = bitly.shorten("https://fairsplitmusic.com/#filter=.works/" + "work" + "#{uid}")
		  short_id_url = id_url.short_url
		  short_uid_url = uid_url.short_url
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
      if self.short_id_url == '' || self.short_id_url.blank?
			  self.short_id_url = short_id_url
			end
			if self.short_uid_url == '' || self.short_uid_url.blank?
			  self.short_uid_url = short_uid_url
			end
    end
end