class Project < ActiveRecord::Base
  validates_presence_of :name, :team
  #validates :demo, :presence => true, :associated => true

  has_one :demo, :class_name => "ProjectAttachment"
  accepts_nested_attributes_for :demo
end
