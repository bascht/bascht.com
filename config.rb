###
# Compass
###
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, autolink: true, gh_blockcode: true

Time.zone = "Berlin"

compass_config do |config|
  # Require any additional compass plugins here.
  config.add_import_path "bower_components/foundation/scss"
  
  # Set this to the root of your project when deployed:
  config.http_path = "/"
  config.css_dir = "stylesheets"
  config.sass_dir = "stylesheets"
  config.images_dir = "images"
  config.javascripts_dir = "javascripts"

  # You can select your preferred output style here (can be overridden via the command line):
  # output_style = :expanded or :nested or :compact or :compressed

  # To enable relative paths to assets via compass helper functions. Uncomment:
  # relative_assets = true

  # To disable debugging comments that display the original location of your selectors. Uncomment:
  # line_comments = false


  # If you prefer the indented syntax, you might want to regenerate this
  # project again passing --syntax sass, or you can uncomment this:
  # preferred_syntax = :sass
  # and then run:
  # sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

page "/atom.xml", :layout => false

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
#activate :automatic_image_sizes



# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do
  # WORKSFORMESOSHUTUP!
  def nav_active(page)
    (current_page.url.start_with?(page)) ? ' active' : ''
  end
  def blog_image(img)
    [current_page.url, img].join 'index/'
  end
end

# set :css_dir, 'css'
# 
# set :js_dir, 'js'
# 
# set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :syntax, :line_numbers => true

activate :blog do |blog|
  blog.name = :bascht
  blog.prefix = 'blog'
  blog.layout = 'article'
  blog.taglink = "tags/{tag}.html"
  blog.permalink = "{year}/{month}/{day}/{title}/index.html"
  blog.calendar_template = "calendar.html"
  blog.tag_template = "tag.html"
end

activate :blog do |blog|
  blog.name = 'tech'
  blog.prefix = 'tech'
  blog.layout = 'tech-article'
end

# Keep this *after* blogs. (https://github.com/middleman/middleman-blog/issues/137)
activate :directory_indexes

#activate :imageoptim
activate :i18n, :langs => [:de, :en]

I18n.default_locale = :de
