require File.expand_path(File.dirname(__FILE__)) + '/base_information'
class News < BaseInformation

  def initialize
    super 'news'
    @domain   = 'http://www.lespros.co.jp'
    top      = Nokogiri::HTML(open("#{@domain}/talent/artists/rena_nounen/"))
    @news     = top.css('#profile-news dl > dt > .news-title > a').first
    @href     = @news.attributes['href'].to_s
    @entry_id = href.split('/').last
  end

  def title
    "能年玲奈NEWS #{@news.content}"
  end

  def href
    @domain + @href
  end

end
