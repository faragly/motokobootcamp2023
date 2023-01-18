import Error "mo:base/Error";
import List "mo:base/List";
import Utils "utils";
import Book "book";

actor {
    // challenge 4
    type Book = Book.Book;
    
    let book : Book = {
        title = "War and Peace";
        pages = 1300;
    };

    // callenge 6
    var books : List.List<Book> = List.nil();

    // challenge 7
    public func add_book(book : Book) : async () {
        books := List.push<Book>(book, books);
    };

    public query func get_books() : async [Book] {
        List.toArray(books);
    };
}