class Event < ApplicationRecord

 validates_presence_of :name, :token

 validates_uniqueness_of :token

 validates_format_of :token, :with => /\A[a-z0-9\-]+\z/

 before_validation :generate_token, :on => :create

 def to_param
  #  "#{self.id}-#{self.name}"
  self.token
 end

 protected

 def generate_token
   self.token = SecureRandom.uuid
 end

end
