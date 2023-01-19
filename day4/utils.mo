import Buffer "mo:base/Buffer";
import List "mo:base/List";
import Prelude "mo:base/Prelude";

module {
    // challenge 1
    // we should pass second argument with compare function for abstart type T
    public func unique<T>(l : List.List<T>) : List.List<T> {
        var list = List.nil<T>();
        let iter = List.toIter<T>(l);
        for (i in iter) {
            if (not List.some<T>(list, func a = a == i)) {
                list := List.push<T>(i, list);
            }
        };
        list;
    };

    // challenge 2
    // perhaps I misunderstand the challenge
    public func reverse<T>(l : List.List<T>) : List.List<T> {
        List.reverse<T>(l);
    };

    // challenge 4
    // - the type of result should be optional - ?Nat,
    // - we should pass second argument with compare function for abstart type T 
    // - I have no idea what return when value not found in the buffer
    public func find_in_buffer<T>(buf: Buffer.Buffer<T>, val: T) : Nat {
        switch (Buffer.indexOf<T>(val, buf, func a = a == val)) {
            case null Prelude.nyi();
            case (?i) i;
        }
    };
}