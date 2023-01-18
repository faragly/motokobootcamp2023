module {
    public type Book = {
        title : Text;
        pages : Nat;
    };

    // challenge 5
    public func create_book(title : Text, pages : Nat) : Book {
        let book : Book = { title; pages; };
        book;
    };
}