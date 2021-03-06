# coding: utf-8
require 'spreadsheet'

class ExportApplicants
  @queue = :export

  def self.perform(email)
    users = User.all
    f = Spreadsheet::Workbook.new
    sheet = f.create_worksheet :name => "sheet1"

    sheet.row(0).concat %w(姓名 邮箱 单位/学校 角色 个人主页 个人介绍)
    users.each_with_index do |u, i|
      sheet.row(i+1).replace [u.name, u.email, u.organ, u.type_name, u.homepage, u.about]
    end

    f.write './applicants.xls'

    # send email
    UserMailer.export_finished_mail(email).deliver
  end
end
