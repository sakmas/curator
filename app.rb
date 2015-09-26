require 'sinatra'
require 'feedjira'

get '/' do
  url = "http://b.hatena.ne.jp/entrylist/it?mode=rss&sort=recent"
  feed = Feedjira::Feed.fetch_and_parse url
  @array = feed.entries.map{|entry|
    {
      "title": entry.title,
      "url": entry.url
    }
  }
  erb :index
end


# hatena rss
# https://syncer.jp/hatebu-api-matome
# http://b.hatena.ne.jp/entrylist/it?mode=rss
# http://b.hatena.ne.jp/entrylist/it?mode=rss&sort=recent


# rss parser
# http://feedjira.com/
