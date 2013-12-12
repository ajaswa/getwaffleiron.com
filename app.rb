require 'sinatra'
require 'slim'
require 'sass'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack
SASS_DIR = File.expand_path("../app/assets/stylesheets", __FILE__)
# Sass.load_path = File.expand_path("../app/assets/stylesheets", __FILE__)

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
  puts "==============================="
  puts "#{Sass}"
  puts "==============================="
  scss template
end
