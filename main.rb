require 'nokogiri'
require 'open-uri'
require './notification'

# 最新のIDをローカルファイルから取得
recent_id = 0
if File.exists?('recent_id.txt')
  recent_id = File.read 'recent_id.txt'
end

# TODO 最新の情報を識別するIDの取得処理
entry_id = 0

if entry_id.to_i > recent_id.to_i
  # PUSH通知
  Notification.new.send '能年玲奈のブログが更新されました', href
  # 最新のIDをローカルファイルに上書き
  File.write 'recent_id.txt', entry_id
end
