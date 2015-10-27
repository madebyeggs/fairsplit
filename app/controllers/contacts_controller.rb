class ContactsController < ApplicationController
  before_filter :authenticate_user!, :except => ["index"]
  
  def index
    bring_in_models
    set_meta_tags :og => {
      :title    => 'Contact Fairsplit Music',
      :url      => "#{@currentUrl}",
      :description      => "Get in touch with us, we'd love to hear what you have to say",
      :image    => 'https://s3.amazonaws.com/fairsplit-images/SPLIT_MUSIC_1200_630_all_top_level.jpg'
    }
    set_meta_tags twitter: {
      card: "summary_large_image",
      site: "@fairsplitmusic",
      title: "Contact Fairsplit music",
      description: "Get in touch with us!",
      image: "https://s3.amazonaws.com/fairsplit-images/SPLIT_MUSIC_1200_630_all_top_level.jpg"
    }
  end
  
end