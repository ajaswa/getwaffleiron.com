require 'sinatra'
require 'slim'
require 'sass'
require 'waffleiron'

Sass::Plugin.options[:style] = :compressed
Sass::Plugin.options[:cache] = false
use Sass::Plugin::Rack
SASS_DIR = File.expand_path("../app/assets/stylesheets", __FILE__)

get '/' do
  slim :index
end

get '/about' do
  slim :about
end

get '/get' do
  slim :get
end

get "/:stylesheet.css" do |stylesheet|
  content_type "text/css"
  template = File.read(File.join(SASS_DIR, "#{stylesheet}.scss"))
  scss template
end
