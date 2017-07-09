class Event < ApplicationRecord

  has_many :registrations, :dependent => :destroy
  include RankedModel
  ranks :row_order
  has_many :tickets, :dependent => :destroy
  accepts_nested_attributes_for :tickets, :allow_destroy => true, :reject_if => :all_blank

  

  STATUS = ["draft", "public", "private"]
   validates_inclusion_of :status, :in => STATUS
  belongs_to :category, :optional => true
before_validation :generate_friendly_id, :on => :create

validates_presence_of :name

scope :only_public, -> { where( :status => "public" ) }
scope :only_available, -> { where( :status => ["public", "private"] ) }

 def to_param
      self.friendly_id
    end
    protected
mount_uploader :logo, EventLogoUploader
mount_uploaders :images, EventImageUploader
   serialize :images, JSON
mount_uploaders :images, EventImageUploader
   serialize :images, JSON
   def generate_friendly_id
     self.friendly_id ||= SecureRandom.uuid
   end


end
