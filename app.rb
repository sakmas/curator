require 'sinatra'
require 'feedjira'
require 'yaml'

configure  do
  set :rssList, YAML.load_file('rss.yml')
end

get '/' do
  @feeds = []
  settings.rssList.each do |url|
    @feeds.push(Feedjira::Feed.fetch_and_parse url)
  end
  erb :index
end
