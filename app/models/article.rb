class Article < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true do |text|
    Transliterate::translit(text).parameterize
  end
  acts_as_taggable_on :artags
  validates_presence_of :name, :text, :message => "- поле не може бути пустим"
  has_attached_file :thumb, :styles => { :small => "300x173" }
  validates_attachment_presence :thumb, :message => "має бути присутнім"
  validates_attachment_content_type :thumb, :content_type => ['image/jpeg', 'image/png'], :message => "має бути наступного формату jpeg, png"


  validate :thumb_size, :if => Proc.new {|w| (w.thumb.file? && "image/jpeg image/png".include?(w.thumb.content_type))}

   def thumb_size
    
      unless [300,173] == [self.thumb.width,self.thumb.height]
        errors.add_to_base("Розмір картинки має бути 300х173px")
      end
   
   end
  
end
