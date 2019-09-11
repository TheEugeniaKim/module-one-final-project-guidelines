# Test branching

Book.create(title: "Harry Potter 1", author: "JK Rowling", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 1997)

Book.create(title: "Harry Potter 2", author: "JK Rowling", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 1998)

Book.create(title: "Harry Potter 3", author: "JK Rowling", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 1999)

Book.create(title: "Harry Potter 4", author: "JK Rowling", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 2000)

Book.create(title: "Harry Potter 5", author: "JK Rowling", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 2003)

Book.create(title: "Harry Potter 6", author: "JK Rowling", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 2005)

Book.create(title: "Harry Potter 7", author: "JK Rowling", fiction_nonfiction: "fiction", 
genre: "fantasy", publication_year: 2007)

Patron.create(name: "Eugenia", birthdate: "2000-03-04")

Loan.create(patron_id: 1, book_id: 1)