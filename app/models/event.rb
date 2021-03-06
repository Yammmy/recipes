class Event < ApplicationRecord
   mount_uploader :logo, EventLogoUploader
   mount_uploaders :images, EventImageUploader
   serialize :images, JSON

   include RankedModel
   ranks :row_order

   has_many :registrations, dependent: :destroy
   has_many :tickets, dependent: :destroy
   accepts_nested_attributes_for :tickets, :allow_destroy => true, :reject_if => :all_blank

   belongs_to :category, :optional => true
   has_many :registration_imports, :dependent => :destroy

   has_many :attachments, :class_name => "EventAttachment", :dependent => :destroy
   accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank

   validates_presence_of :name, :token

   validates_uniqueness_of :token

   validates_format_of :token, :with => /\A[a-z0-9\-]+\z/

   STATUS = ["draft", "public", "private"]

   validates_inclusion_of :status, :in => STATUS

   before_validation :generate_token, :on => :create

   scope :only_public, -> { where( :status => "public")}
   scope :only_available, -> { where( :status => ["public", "private"])}

   def to_param
    #  "#{self.id}-#{self.name}"
    self.token
   end

   protected

   def generate_token
     self.token = SecureRandom.uuid
   end

end
