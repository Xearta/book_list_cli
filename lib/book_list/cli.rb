# CLI Controller
class BookList::CLI
  # Welcome message and start the CLI Loop
  def call
    puts "Welcome to the Book List CLI!

This app will give you the top 15 NYT best sellers in a given week!"
    start
  end

  # CLI "loop"
  def start
    BookList::Book.all.clear
    puts "================================="

    # Ask the user to input the date for the week they want to see
    message =  "Enter the week you want to see [2015+] (Format: MM-DD-YYYY)"
    puts message
    date = gets.chomp

    # Check if the date is valid in the format we need (MM-DD-YYYY)
    until valid_date?(date)
      puts "\nIncorrect date format! Please try again.\n"
      puts message
      date = gets.chomp
    end
    # Convert date to the necessary format for scraper
    date2 = date.split('-')

    # Ask the user for fiction or nonfiction
    message =  "Enter fiction or non-fiction (f/nf)"
    puts message
    input = gets.chomp.downcase
    # Loop until correct input
    until input == "f" || input == "nf"
      puts "\nIncorrect Response. Please try again.\n"
      puts message
      input = gets.chomp.downcase
    end
    # Respond accordingly to input given
    if input == "f"
      genre = "Fiction"
    elsif input == "nf"
      genre = "Nonfiction"
    end

    puts "\nSearching...\n"

    # Create the book objects (15 books)
      BookList::Scraper.get_book_list(date2,genre).each do |b|
        BookList::Book.new_from_webpage(b)
      end

    # Print all of the books for the specififed date
    print_books(date,genre)

    # Ask for more information on the given list
    message = "Would you like more information on any of these books? Enter Y or N"
    puts ""
    puts message
    input = gets.chomp.downcase

    # Check for valid (Y or N) input and respond accordingly
    if valid_input?(input,message) == "y"
      puts "Which book? (Enter the number)"
      input = gets.chomp.to_i
      book = BookList::Book.find(input)
      print_book(book)
    end

    # Ask the user if they want another list
    message = "Would you like to see another list? Enter Y or N"
    puts message
    input = gets.chomp.downcase

    # Check for valid (Y or  N) input and respond accordingly
    if valid_input?(input,message) == "y"
      start
    elsif valid_input?(input,message) == "n"
      puts ""
      puts "Thank you! Have a great day!"
      exit
    end
  end

  # Prints the additional information on the book requested
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

  # Prints the book list to the command line
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

  # Check if the given input is either a Y or N
  def valid_input?(input,message)
    until input == "y" || input == "n"
      puts "\nIncorrect Response. Please try again.\n"
      puts message
      input = gets.chomp.downcase
    end
    return input
  end

  def valid_date?(string)
    return true if string == ''

    !!(string.match(/\d{2}-\d{2}-\d{4}/) && Date.strptime(string, '%m-%d-%Y'))
  rescue ArgumentError
    false
  end
end
