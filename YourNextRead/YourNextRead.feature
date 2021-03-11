Feature: Goodreads username input
    As a user I would like to get recommendations specific to my goodreads username
    I need to have my username validated

    Scenario: Invalid username
      Given I am using an invalid username
       When I input my username
        And Click get recommendations
       Then I am notified that my username is invalid
       When I click ok
       Then I am redirected to the user login page
    
    Scenario: Valid username
      Given I am using a valid username
       When I input my username
        And Click get recommendations
       Then My username is valid
        And Recommendations begin to load

Feature: Recommendations loading
    As a user I want my recommendations to load within a reasonable time

    Scenario: Load and reload recommendations
      Given I am using a valid username 
       When I input my username
        And Click get recommendations
       Then within 5 seconds my recommendations have loaded
       When I reload recommendations
       Then within 5 seconds my recommendations have loaded

Feature: Multiple book suggestions
    As a user I want to be able to swipe between multiple book suggestions

    Scenario: Swiping between book suggestions
      Given Book suggestions have loaded
        And I record the book that has been recommended
       When I swipe right
       Then A new book has been recommended
        And I record the book that has been recommended
       When I swipe right
       Then A new book has been recommended
        And I record the book that has been recommended
       When I swipe right
       Then A new book has been recommended
        And I record the book that has been recommended
       When I swipe right
       Then A new book has been recommended
        And I record the book that has been recommended
       When I swipe left
        And Pop a book off the stack
       Then The same book has been recommended
       When I swipe left
        And Pop a book off the stack
       Then The same book has been recommended
       When I swipe left
        And Pop a book off the stack
       Then The same book has been recommended
       When I swipe left
        And Pop a book off the stack
       Then The same book has been recommended
       When I swipe left
        And Pop a book off the stack
       Then The same book has been recommended

Feature: Content display
    As a user I would like to be displayed some relevant information about the book

    Scenario: Book information loaded
      Given A simulated book has been loaded
       Then There is a relevant book cover that fits into the space
        And There is a relevant book title and author that fits into the space
        And There is a relevant book description that fits into the space

Feature: Open in Goodreads
    As a user I would like to be able to open a book in goodreads to find out more about it

    Scenario: Open a book in goodreads
      Given A simulated book has been loaded
       When I click Open in goodreads
       Then The correct book is opened in the goodreads app or website
    
Feature: Review display
    As a user I would like to see some reviews from people that have enjoyed the same books as me

    Scenario: Two reviews on the book suggestion page
      Given A simulated book has been loaded
       Then 2 reviews have been loaded
        And The reviews show a book cover
        And The reviews show star ratings for both books
        And The review shows a shortened comment
       When I click on a review comment
       Then An overlay section appears
        And Both the book covers are displayed
        And Both star ratings are displayed
        And A full scrollable user review is displayed
       When I press close on the overlay
       Then I am taken back to the book suggestion

    Scenario: Further reviews
      Given A simulated book has been loaded
        And I record the book title and author
       When I click Why did we suggest this book?
       Then The why we think you will like page displays
        And The book title and author are displayed
        And A description of the algorithm is displayed
        And 4 reviews are loaded
       When I click on a review comment
       Then An overlay section appears
        And Both the book covers are displayed
        And Both star ratings are displayed
        And A full scrollable user review is displayed
       When I press close on the overlay
        And I click Back to the book
       Then The same book is loaded

Feature: Options to buy
    As a user I would like to have a couple of ethical options to buy the book

    Scenario: Ethical consumer booksellers displayed
      Given A simulated book has been loaded
       Then Ethical consumer booksellers are displayed
       When I click on ethical consumer booksellers
       Then I am taken to the ethical consumer booksellers website
    
    Scenarios: Libro.fm displayed
      Given A simulated book has been loaded
       Then Libro.fm is displayed
       When I click on libro.fm
       Then I am taken to the ethical consumer booksellers app or website
       

Feature: About page
    As a user I would like to be able to find out more about the app

    Scenario: About from home page
      Given I am on the title page
       When I click about
       Then I am taken to the about page
        And The inspiration is displayed
        And Further detail about the algorithms and design are displayed
        And Links to the code are displayed
       When I click back
       Then I am taken to the title page

    Scenario: About from book page
      Given A simulated book has been loaded
       When I click about
       Then I am taken to the about page
        And The inspiration is displayed
        And Further detail about the algorithms and design are displayed
        And Links to the code are displayed
       When I click back
       Then I am taken to the book page
    