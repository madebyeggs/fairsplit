class Work < ActiveRecord::Base
  attr_accessible :title, :client, :description, :vimeo, :image, :large_image, :type_of_work, :artist_name, :track_name, 
  :latest, :artist_id, :soundcloud, :homepage_title, :square_image, :uid
  
  before_save :falsify_all_others, :create_unique_id
  belongs_to :artist
  
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
      main: '300X300>'
    }

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :large_image, :content_type => /\Aimage\/.*\Z/
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :square_image, :content_type => /\Aimage\/.*\Z/
    
    def falsify_all_others
      if self.latest == true
        self.class.where("id != ?", self.id).update_all("latest = 'false'")
      end
    end
    
    def create_unique_id
      self.uid = rand.to_s[2..16]
    end
end