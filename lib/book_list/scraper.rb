# Scraper
class BookList::Scraper

  # /2020/04/19/combined-print-and-e-book-fiction/
  # /2020/04/19/combined-print-and-e-book-nonfiction/

  # If nothing is entered (Just spammed 'enter')
  # => It will display the latest non-fiction list


  # Accept a specified date and genre
  # Scrape the specified page based on the date and genre given
  def self.get_page(date,genre)
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/#{date[2]}/#{date[0]}/#{date[1]}/combined-print-and-e-book-#{genre}/"))
  end

  # Use the scraped page from #get_page
  def self.get_book_list(date,genre)
    results = self.get_page(date,genre).css("ol.css-12yzwg4 li.css-13y32ub")
  end
end
