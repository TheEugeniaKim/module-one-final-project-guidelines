class Helper

    attr_accessor :current_patron

    def initialize()
        # @current_patron = current_patron
        # binding.pry
    end

    def start
        puts "Welcome to the library"
        puts "Do you have an account with us? (Y/N)"
        answer = gets.chomp
        if answer == "Y"
            puts "Welcome Back"
            login
        elsif answer == "N"
            create_account 
        end
    end

    def create_account
        puts "Create Account"
        puts "Enter name: " 
        name = gets.chomp
        puts "Enter birthdate (YYYY-DD-MM): "
        birthdate = gets.chomp
        @current_patron = Patron.create(name: name, birthdate: birthdate)
        main_menu
    end

    def find_patron(patron_name, patron_birthdate)
        Patron.find_by(name: patron_name, birthdate: patron_birthdate)
    end

    def login
        puts "Enter username"
        name = gets.chomp
        puts "Enter birthdate"
        birthdate = gets.chomp
        @current_patron = find_patron(name, birthdate) 
        main_menu
    end

    def main_menu 
        puts "Welcome to Main Menu"
        puts "Please select an action by typing a number"
        puts "1. View My Books on Loan"
        puts "2. Search Library Catalog"
        puts "3. Check out book"
        puts "4. Logout"
        input = gets.chomp 
        if input == "1"
            view_my_books    
        elsif input == "2"
            search_library_catalog
        elsif input == "3"
            check_out_book
        # elsif input == 4
        #     @current_patron = nil 
        #     puts "Goodbye"
        #     start 
        end
    end

    def view_my_books
        binding.pry
        @current_patron.books 
    end

    def search_library_catalog
        puts "Enter title you want to search: "
        input = gets.chomp 
        binding.pry
        Book.find_by(title: input)
    end

    def check_out_book
        puts "Please enter the title of the book you'd like to check out: "
        input = gets.chomp 
        puts Book.find_by(title: input)
        checkout_book = Book.input.title  
        puts "Is this the book you want? (Y/N)"
        answer = gets.chomp 
        if answer == "Y" or "y"  
            binding.pry
            Loan.create(patron_id: @current_patron.patron_id, book_id: checkout_book.book_id)
        elsif answer == "N" or "n"
            puts "We do not have the book you are looking for please search the library catalog for our books"
        end               
    end

     
end