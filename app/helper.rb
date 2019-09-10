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
    Patron.create(name: name, birthdate: birthdate)
    
    # main menu method
end

def login
    puts "Enter username"
    name = gets.chomp
    puts "Enter birthdate"
    birthdate = gets.chomp
    # main menu method
end