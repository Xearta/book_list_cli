This application will be a CLI gem that will scrap the NYT best selling fiction and non-fiction lists depending on the week specified.

## Classes:
- CLI Class
- BookList Class
- Scraper Class

## Process:
#### PROCESS REPEATS UNTIL USER ENTER "EXIT"
1. Greet User and ask for date (CLI)
2. Ask for Fiction or Non-Fiction (CLI)
3. Scrape selected page (Scraper)
4. Create objects of the list of books (BookList Class)
5. Print the list of books (CLI Class)
6. Ask if user wants more information about a book by selecting number (CLI Class)
7a.  => 'list' -> for another list. Restart loop. (CLI Class)
7b.  => '#'    -> Scrape the page for buy link and review link (Scraper Class)
               -> Add that information to the book object (BookList Class)
               -> Display that information to the user and restart loop (CLI Class)
8. Program exits

## Output:
1: UNBROKEN by Laura Hillenbrand
  Pub: Random House | Rank: 184 weeks on the list
  An Olympic runner’s story of survival as a prisoner of the Japanese in World War II.

2: KILLING PATTON by Bill O'Reilly and Martin Dugard
  Pub: Holt | Rank: 13 weeks on the list
  The host of “The O’Reilly Factor” recounts the strange death of Gen. George S. Patton in December 1945.

  ...
