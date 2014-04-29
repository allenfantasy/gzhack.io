class Contact < ActiveRecord::Base
  validates_presence_of :name, :tel, :email, :role, :intention

  # thanks to http://stackoverflow.com/questions/201323/using-a-regular-expression-to-validate-an-email-address
  validates_format_of :email, :with => /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/i

  belongs_to :project
end
