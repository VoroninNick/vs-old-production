class Work < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true do |text|
    Transliterate::translit(text).parameterize
  end
  acts_as_taggable_on :tags
  validates_presence_of :name, :task, :solution, :chapter, :customer,
    :message => "- поле не може бути пустим"
  has_attached_file :thumb, :styles => { :small => "300x173" }
  validates_attachment_presence :thumb, :message => "має бути присутнім"
  validates_attachment_content_type :thumb, :content_type => ['image/jpeg', 'image/png'], :message => "має бути наступного формату jpeg, png"
  validate :thumb_size, :if => Proc.new {|w| (w.thumb.file? && "image/jpeg image/png".include?(w.thumb.content_type))}
  validates_inclusion_of :category, :in => %w( logo print web )
  named_scope :logo, :conditions => {:category => "logo", :publish => true}, :order => "position"
  named_scope :web, :conditions => {:category => "web", :publish => true}, :order => "position"
  named_scope :print, :conditions => {:category => "print", :publish => true}, :order => "position"
  named_scope :featured, :conditions => "publish and featured", :order=>"updated_at DESC"

  
   def thumb_size
   
      unless [620,357] == [self.thumb.width,self.thumb.height]
        errors.add_to_base("Розмір картинки має бути 620х357px")
      end
   
   end

  
end
