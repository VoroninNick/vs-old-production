class Subscriber < ActiveRecord::Base

  validates_presence_of :email, :message => "повинна бути присутня"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      :message => "задано не правильно", :if => Proc.new { |subscriber| !subscriber.email.empty? }

  validates_uniqueness_of :email, :message => "вже присутня"

  
end
