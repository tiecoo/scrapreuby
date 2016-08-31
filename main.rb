require 'mechanize'
mechanize = Mechanize.new
page = mechanize.get('http://en.wikipedia.org/wiki/Main_Page')
link = page.link_with(text: 'Random article')
page = link.click
puts page.uri
puts page.title

page = mechanize.get('https://www.gov.uk/')
form = page.forms.first
form['q'] = 'passport'
page = form.submit
page.search('#results h3').each do |h3|
  puts h3.text.strip
end