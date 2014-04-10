# coding: utf-8
class User < ActiveRecord::Base
  TYPES = {
    'coder' => '程序员',
    'designer' => '设计师',
    'pm' => '产品经理',
    'others' => '其他'
  }

  has_many :files, :class_name => "UserFile"

  validates_presence_of :name, :tel, :organ, :homepage, :user_type, :about
  validates_format_of :tel, :with => /[\d]{11}/

  def homepages
    homepage.split(' ').join("<br >")
  end

  def type_name
    TYPES[type]
  end
end
