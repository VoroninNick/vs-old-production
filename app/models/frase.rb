class Frase < ActiveRecord::Base
  validates_presence_of :name, :description, :message => "не могут быть пустыми"
end
