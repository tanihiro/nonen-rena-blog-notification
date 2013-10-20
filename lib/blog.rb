require File.expand_path(File.dirname(__FILE__)) + '/base_information'
class Blog < BaseInformation

  def initialize
    super 'blog'
    top       = Nokogiri::HTML(open('http://yaplog.jp/lp-n-rena/')) 
    link      = top.css('.entry > .entry_title > h3 > a').first
    @href     = link.attributes['href'].to_s
    @entry_id = href.split('/').last
  end

  def title
    '能年玲奈のブログが更新されました'
  end

  def href
    @href
  end

end
