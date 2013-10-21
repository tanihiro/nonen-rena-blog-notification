require File.expand_path(File.dirname(__FILE__)) + '/lib/notification'
require File.expand_path(File.dirname(__FILE__)) + '/lib/blog'
require File.expand_path(File.dirname(__FILE__)) + '/lib/news'
require File.expand_path(File.dirname(__FILE__)) + '/lib/yahoo_news'

notification = Notification.new
informations = [
  Blog.new,
  News.new,
  YahooNews.new
]

informations.each do |information|
  next unless information.update?
  notification.send information.title, information.href
  information.update_recent_id
end
