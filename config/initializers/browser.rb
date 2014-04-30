Rails.configuration.middleware.use Browser::Middleware do
  redirect_to '/noie.html' unless browser.modern?
end
