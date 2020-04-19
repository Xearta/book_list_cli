# CLI Controller
class BookList::CLI
  def call
    puts "Welcome to the Book List CLI!

This app will give you the top 15 NYT best sellers in a given week!"
    start
  end

  def start
    BookList::Book.all.clear
    puts "================================="
    puts "Enter the week you want to see (Format: MM-DD-YYYY)"
    date = gets.chomp
    test = date.split('-')

    puts "Enter fiction or non-fiction (f/nf)"
    genre = gets.chomp.downcase
    if genre == "f"
      test2 = "Fiction"
    else
      test2 = "Nonfiction"
    end

    puts "\nSearching...\n"

    BookList::Scraper.new.make_book_list(test,test2)
    # Print all of the books for the specififed date

    print_books(date,test2)

    puts ""
    puts "Would you like more information on any of these books? Enter Y or N"
    input = gets.chomp.downcase
    until input == "y" || input == "n"
      puts ""
      puts "Would you like more information on any of these books? Enter Y or N"
      input = gets.chomp.downcase
    end

    if input == "y"
      puts "Which book? (Enter the number)"
      input = gets.chomp.to_i
      book = BookList::Book.find(input)
      print_book(book)
    end


    puts "Would you like to see another list? Enter Y or N"
    input = gets.chomp.downcase
    until input == "y" || input == "n"
      puts ""
      puts "Would you like to see another list? Enter Y or N"
      input = gets.chomp.downcase
    end

    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you! Have a great day!"
      exit
    end
  end

  def print_book(book)
    puts ""
    puts "======#{book.title} #{book.author}======="
    puts ""
    puts "- Publisher: #{book.publisher}"
    puts "- Time on List: #{book.list_time}"
    puts "- Description: #{book.description}"
    puts "- Purchase: #{book.purchase_link}"
    puts ""

  end

  def print_books(date,genre)
    if date == ""
      date = "This Week"
    end
    puts ""
    puts "========#{genre} Books For The Week of: #{date}======"
    puts ""
    BookList::Book.all.each_with_index do |book, index|
      puts "#{index+1}. #{book.title} #{book.author}"
    end
  end

end
