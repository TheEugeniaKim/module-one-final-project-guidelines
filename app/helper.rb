def start
    puts "Welcome to the library"
    puts "Do you have an account with us? (Y/N)"
    answer = gets.chomp
    if answer == "Y"
        puts "Welcome Back"
    elsif answer == "N"
        puts "Create Account"
        puts "Enter name: " 
        name = gets.chomp
        puts "Enter birthdate (YYYY-DD-MM): "
        birthdate = gets.chomp
        Patron.create(name: name, birthdate: birthdate)
    end
end

# start