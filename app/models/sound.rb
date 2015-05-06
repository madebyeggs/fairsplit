class Sound < ActiveRecord::Base
  attr_accessible :title, :description, :soundcloud, :image, :latest, :homepage_title, :square_image, :vimeo, :uid
  before_save :falsify_all_others, :create_unique_id
  
  # This method associates the attribute ":avatar" with a file attachment
    has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      main: '710x210>'
    }
    
    has_attached_file :square_image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      main: '300x300>'
    }

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
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