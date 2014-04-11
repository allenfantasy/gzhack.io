# coding: utf-8
class User < ActiveRecord::Base
  TYPES = {
    'coder' => '程序员',
    'designer' => '设计师',
    'pm' => '产品经理',
  }

  has_many :attachments, :dependent => :destroy
  accepts_nested_attributes_for :attachments

  validates_presence_of :name, :tel, :organ, :user_type, :about
  validates_format_of :tel, :with => /[\d]{11}/

  def homepages
    homepage.split(' ').join("<br >")
  end

  def type_name
    TYPES[user_type] || user_type
  end
end
