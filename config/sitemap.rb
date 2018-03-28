# Change this to your host. See the readme at https://github.com/lassebunk/dynamic_sitemaps
# for examples of multiple hosts and folders.
host 'www.wedimage.com'

sitemap :wedimage do
  url 'https://www.wedimage.com', last_mod: Time.now, change_freq: "daily", priority: 1.0
  url 'https://www.wedimage.com/photos', last_mod: Time.now, change_freq: "daily", priority: 0.5
  url 'https://www.wedimage.com/real-weddings', last_mod: Time.now, change_freq: "daily", priority: 0.5
  url 'https://www.wedimage.com/inspiration', last_mod: Time.now, change_freq: "daily", priority: 0.5
  url 'https://www.wedimage.com/about', last_mod: Time.parse('Sept 1, 2017'), priority: 0.1
  url 'https://www.wedimage.com/about/site-etiquette', last_mod: Time.parse('Sept 1, 2017'), priority: 0.1
  url 'https://www.wedimage.com/about/privacy-policy', last_mod: Time.parse('Sept 1, 2017'), priority: 0.1
  url 'https://www.wedimage.com/about/copyright-policy', last_mod: Time.parse('Sept 1, 2017'), priority: 0.1
  url 'https://www.wedimage.com/about/terms-of-use', last_mod: Time.parse('Sept 1, 2017'), priority: 0.1
end

sitemap_for Vendor.visible, name: :vendors do |vendor|
  url "https://www.wedimage.com/vendors/#{vendor.slug}-#{vendor.id}",
      last_mod: vendor.updated_at,
      priority: 0.5
end
sitemap_for Photo.active, name: :photos do |photo|
  url "https://www.wedimage.com/p/#{photo.id}",
      last_mod: photo.updated_at,
      priority: 0.2
end
sitemap_for Album.published, name: :albums do |album|
  url "https://www.wedimage.com/#{album.album_type == :featured ? 'inspiration' : 'real-weddings'}/#{album.title.parameterize[0..30]}-#{album.id}",
      last_mod: album.updated_at,
      priority: 0.3
end

# Ping search engines after sitemap generation:

ping_with "http://#{host}/sitemap.xml"
