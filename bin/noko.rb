require 'nokogiri'
require 'open-uri'
require 'rubygems'
doc = Nokogiri::HTML(open("http://1000mostcommonwords.com/1000-most-common-german-words/"))
table = doc.css('table').first
rows = table.css('tr')
text_all_rows = rows.map do |row|
  row_german= row.css('td[2]').text
  row_eng = row.css('td[3]').text
  @card=Card.new(original_text: row_german, translated_text: row_eng)
  @card.save
end