require "open-uri"
require "nokogiri"
require "csv"

def scrap
  puts "What are you searching on Etsy?"
  article = gets.chomp

  # 1. We get the HTML file thanks to open-uri
  file = open("https://www.etsy.com/fr/search?q={article}")

  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML(file)

  # 3. We search every elements with class="card" in our HTML doc

  ideas = []
  doc.search(".card-meta-row")[4...24].each do |card|
    # 4. for each element found, we extract its title and print it
    ideas << card.text.strip
  end
  return ideas
end

def save_to_csv(giftlist)
  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath    = 'giftlist.csv'

  CSV.open(filepath, 'wb', csv_options) do |csv|
    csv << ['Name', 'Bought']
    giftlist.each do |gift|
      csv << [gift[:name], gift[:bought]]
    end
  end
end

def load_from_csv
  csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
  filepath    = 'giftlist.csv'

  giftlist = []
  if File.exist?(filepath)
    CSV.foreach(filepath, csv_options) do |row|
      giftlist << {name: row['Name'], bought: row["Bought"] == "true"}
    end
  end
  return giftlist

end

# scrap.each_with_index do |idea, index|
#   puts "#{index + 1} - #{idea}"
# end
