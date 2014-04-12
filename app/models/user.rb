# coding: utf-8
class User < ActiveRecord::Base
  TYPES = {
    'coder' => '程序员',
    'designer' => '设计师',
    'pm' => '产品经理',
  }

  has_many :attachments, :dependent => :destroy
  accepts_nested_attributes_for :attachments

  validates_presence_of :name, :email, :organ, :user_type, :about

  # thanks to http://stackoverflow.com/questions/201323/using-a-regular-expression-to-validate-an-email-address
  validates_format_of :email, :with => /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/i

  def homepages
    homepage.split(' ').join("<br >")
  end

  def type_name
    TYPES[user_type] || user_type
  end

  def export
  end
end
