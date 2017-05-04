class Registration < ApplicationRecord
  STATUS = ["pending", "confirmed"]
  validates_inclusion_of :status, :in => STATUS
  validates_presence_of  :status, :ticket_id

  belongs_to :event
  belongs_to :ticket
  belongs_to :user, :optional => true

  before_validation :genetate_uuid, :on => :create

  def to_params
    self.uuid
  end

  protected

  def genetate_uuid
    self.uuid = SecureRandom.uuid
  end
end
