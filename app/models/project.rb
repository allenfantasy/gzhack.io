class Project < ActiveRecord::Base
  paginates_per 10
  validates_presence_of :name, :team
  #validates :demo, :presence => true, :associated => true

  has_one :demo, :class_name => "ProjectAttachment"
  has_many :contacts
  accepts_nested_attributes_for :demo
end
