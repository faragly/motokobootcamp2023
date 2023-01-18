import Array "mo:base/Array";
import Error "mo:base/Error";
import Int "mo:base/Int";
import Result "mo:base/Result";
import Buffer "mo:base/Buffer";

module {
    // challenge 1
    public func second_maximum(array : [Int]) : Int {
        let size = array.size();
        switch(size) {
            case (0 or 1) 0;
            case _ {
                let sorted = Array.sort(array, Int.compare);
                sorted[size - 2];
            };
        };
    };

    // challenge 2
    public func remove_even(array : [Nat]) : [Nat] {
        Array.filter<Nat>(array, func x = x % 2 == 1);
    };

    // challenge 3
    public func drop<T>(xs : [T], n : Nat) : [T] {
        let size = xs.size();
        let buffer = Buffer.fromArray<T>(xs);
        let subBuffer = Buffer.subBuffer<T>(buffer, n, size - n);
        buffer.clear();
        Buffer.toArray<T>(subBuffer);
    };
}