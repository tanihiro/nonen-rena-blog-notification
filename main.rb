require 'nokogiri'
require 'open-uri'
require './notification'

# 最新のIDをローカルファイルから取得
recent_id = 0
if File.exists?('recent_id.txt')
  recent_id = File.read 'recent_id.txt'
end

# 公式BLOGから最新のIDを取得
top      = Nokogiri::HTML(open('http://yaplog.jp/lp-n-rena/')) 
link     = top.css('.entry > .entry_title > h3 > a').first
href     = link.attributes['href'].to_s
entry_id = href.split('/').last

if entry_id.to_i > recent_id.to_i
  # PUSH通知
  Notification.new.send '能年玲奈のブログが更新されました', href
  # 最新のIDをローカルファイルに上書き
  File.write 'recent_id.txt', entry_id
end
