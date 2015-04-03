class Artist < ActiveRecord::Base
  attr_accessible :name, :description, :soundcloud, :image, :small_image
  has_many :works
  
  # This method associates the attribute ":avatar" with a file attachment
    has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      main: '710x210>'
    }
    
    has_attached_file :small_image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      main: '300x300>'
    }

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :small_image, :content_type => /\Aimage\/.*\Z/
    
end