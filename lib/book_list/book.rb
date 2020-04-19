class BookList::Book
  attr_accessor :title, :author, :genre, :publisher, :list_time, :description, :purchase_link, :review

  @@all = []

  def self.new_from_webpage(b)
    self.new(
        b.css('h3.css-5pe77f').text, # Title
        b.css('p.css-hjukut').text, #Author
        b.css('p.css-heg334').text, #Publisher
        b.css('p.css-1o26r9v').text, #List Time
        b.css('p.css-14lubdp').text, #Description
        b.css('a.css-hndxeu').first['href'] #Purchase Link

    )
  end

  def initialize(title=nil, author=nil, publisher=nil, list_time=nil, description=nil, purchase_link=nil)
    @title = title
    @author = author
    @publisher = publisher
    @list_time = list_time
    @description = description
    @purchase_link = purchase_link
    @@all << self
  end


  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end


end
