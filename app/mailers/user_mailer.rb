# coding: utf-8
class UserMailer < ActionMailer::Base
  default from: 'cpanel@gzhack.io'

  def export_finished_mail(email)
    attachments['报名信息.xls'] = File.read('./applicants.xls')
    mail(to: email, subject: '2014广州创客马拉松报名信息')
  end
end
