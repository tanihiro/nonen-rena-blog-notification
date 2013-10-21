require File.expand_path(File.dirname(__FILE__)) + '/base_information'
class YahooNews < BaseInformation

  def initialize
    super 'yahoo_news'
    scraping
  end

  def title
    "能年玲奈YahooNEWS #{@news.content}"
  end

  def href
    @href
  end

  private
  def scraping
    top      = Nokogiri::HTML(open("http://news.search.yahoo.co.jp/search?p=%C7%BD%C7%AF%CE%E8%C6%E0&ei=EUC-JP&fr=news_sw"))
    @news     = top.css('#NSm > .cf > .t > a').first
    @href     = @news.attributes['href'].to_s
    parameter = @href.scan(/a=(.*)/).first.first.split('-')
    @entry_id = parameter[0] + parameter[1]
  end

end
