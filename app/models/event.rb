class Event < ActiveRecord::Base
  has_many :participants, :class_name => "User"
end
