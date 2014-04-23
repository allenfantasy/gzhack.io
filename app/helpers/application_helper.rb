module ApplicationHelper
  def language_nav
    content_tag :li do
      if default_locale?
        link_to "English", :locale => 'en'
      else
        link_to "中文", :locale => 'zh-CN'
      end
    end
  end

  def default_locale?
    I18n.locale == I18n.default_locale
  end
end
