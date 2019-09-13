#### Create Book Instances

Book.destroy_all

puts "creating books"
hp1 = Book.create(title: "Harry Potter 1", author: "JK Rowling", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 1997)

hp6 = Book.create(title: "Harry Potter 6", author: "JK Rowling", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 2005)

hp7 = Book.create(title: "Harry Potter 7", author: "JK Rowling", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 2007)

lr1 = Book.create(title: "Lord of the Rings 1", author: "J.R.R. Tolkien", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 1954)

lr2 = Book.create(title: "Lord of the Rings 2", author: "J.R.R. Tolkien", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 1954)

fsg = Book.create(title: "Fifty Shades of Grey", author: "E.L. James", fiction_nonfiction: "fiction", 
genre: "erotic fantasy", publication_year: 2011)

am = Book.create(title: "The Autobiography of Malcolm X", author: "Malcolm X", fiction_nonfiction: "nonfiction", 
genre: "biography", publication_year: 1965)

ggs = Book.create(title: "Guns, Germs, and Steel", author: "Malcolm X", fiction_nonfiction: "nonfiction", 
genre: "general nonfiction", publication_year: 1997)
puts "created books"
#### Create Patron Instances

Patron.destroy_all

puts "creating patrons"
eugenia = Patron.create(name: "Eugenia", birthdate: "1994-04-07")
nick = Patron.create(name: "Nick", birthdate: "1991-09-05")
bill = Patron.create(name: "Bill", birthdate: "2000-01-01")
cindy = Patron.create(name: "Cindy", birthdate: "1995-12-12")
puts "created patrons"

#### Create Loan Instances

Loan.destroy_all

puts "creating loans"
Loan.create(patron_id: eugenia.id, book_id: hp1.id, status: "checked out")
Loan.create(patron_id: eugenia.id, book_id: lr2.id, status: "checked out")
Loan.create(patron_id: nick.id, book_id: am.id, status: "checked out")
Loan.create(patron_id: bill.id, book_id: hp7.id, status: "checked out")
puts "created loans"

