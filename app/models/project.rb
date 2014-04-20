class Project < ActiveRecord::Base
  validates_presence_of :name, :team
end
