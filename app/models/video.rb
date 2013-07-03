class Video < ActiveRecord::Base
  #attr_accessible :videohost_id, :event_id, :provider_id_code, :published, :translations_attributes
  translates :name, :description, :fallbacks_for_empty_translations => true
  belongs_to :videohost
  belongs_to :event

  accepts_nested_attributes_for :translations, 
      :reject_if =>
         proc {|att| (att['name'].blank? && att['description'].blank?) || att['video_id'].blank? }  

  validates_presence_of :videohost_id

  def embed_code
    case videohost.name.downcase
    when 'youtube'
      return '<iframe width="420" height="315" src="http://www.youtube.com/embed/' + provider_id_code + '" frameborder="0" allowfullscreen></iframe>'

    when 'vimeo'
      v = Vimeo::Simple::Video.info(provider_id_code).first
      w = v['width'] ||= 690
      h = v['height'] ||= 500
      if w.to_i > 690
        w = 690
        h = 500
      end
      return '<iframe allowfullscreen="" frameborder="0" height="' + h.to_i.to_s + '" mozallowfullscreen="" src="http://player.vimeo.com/video/' + provider_id_code.to_s  + '"?badge=0" webkitallowfullscreen="" width="' + w.to_i.to_s + '" /></iframe>'
    else
      return "error"
    end
  end

end
