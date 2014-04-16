SitemapGenerator::Sitemap.default_host = "http://gzhack.io"

SitemapGenerator::Sitemap.create do
  add '/home', changefreq: 'daily'
  add '/about', changefreq: 'daily'
  add '/en/about', changefreq: 'daily'
  add '/zh-CN/about', changefreq: 'daily'
  add '/signup', changefreq: 'daily'
  add '/en/signup', changefreq: 'daily'
  add '/zh-CN/signup', changefreq: 'daily'
end
