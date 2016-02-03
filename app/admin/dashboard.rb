ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      
      column do
        panel "Artists" do
          table_for Artist.common_order.each do |artist|
            column(:name)    {|artist| artist.name}
            column(:info)    {|artist| artist.description.slice!(0, 20)}
            column(:latest)    {|artist| artist.latest}
            column(:home)    {|artist| artist.homepage}
            column(:soundcloud)    {|artist| artist.soundcloud}
            column(:FB_image)    {|artist| if artist.facebook_image == '' || artist.facebook_image.blank? then "no" else "yes" end}
            column(:FB_url)    {|artist| if artist.fb_url == '' || artist.fb_url.blank? then "no" else "yes" end}
            column(:Twit_url)    {|artist| if artist.twitter_name == '' || artist.twitter_name.blank? then "no" else "yes" end}
            column()    {|artist| link_to "Edit", edit_artist_path(artist), :title => "Edit #{artist.name}",:class => "tips"}
          end
        end
      end
      
      column do
        panel "Releases" do
          table_for Sound.common_order.each do |sound|
            column(:title)    {|sound| sound.title}
            column(:info)    {|sound| if sound.description == "" || sound.description.blank? then "None" else sound.description end}
            column(:soundcloud)    {|sound| sound.soundcloud}
            column(:latest)    {|sound| sound.latest}
            column(:homepage)    {|sound| sound.homepage}
            column(:FB_image)    {|sound| if sound.facebook_image == '' || sound.facebook_image.blank? then "no" else "yes" end}
            column()    {|sound| link_to "Edit", edit_sound_path(sound), :title => "Edit #{sound.title}",:class => "tips"}
          end
        end
      end

    end # columns
  end # content
end
