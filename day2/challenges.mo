import Text "mo:base/Text";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";
import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {
    // challenge 1
    public query func average_array(array : [Int]) : async Int {
        var sum : Int = 0;
        for (i in array.vals()) {
            sum += i;
        };
        sum / array.size();
    };

    // challenge 2
    public query func count_character(t : Text, c : Char) : async Nat {
        char_count(t, c);
    };

    func char_count(t : Text, c : Char) : Nat {
        var count : Nat = 0;
        for (i in Text.toIter(t)) {
            if (Char.equal(i, c)) {
                count += 1;
            }
        };
        count;
    };

    // challenge 3
    public query func factorial(n : Nat) : async Nat {
        var fact : Nat = 1;
        for (i in Iter.range(1, n)) {
            fact *= i;
        };
        fact;
    };

    // challenge 4
    public query func number_of_words(t : Text) : async Nat {
        char_count(Text.trim(t, #char ' '), ' ');
    };

    // challenge 5
    // based on https://github.com/dfinity/motoko-base/blob/master/src/Buffer.mo#L1647
    public query func find_duplicates(a : [Nat]) : async [Nat] {
        let buffer = Buffer.fromArray<Nat>(a);
        let size = buffer.size();
        let indices = Array.tabulate<(Nat, Nat)>(a.size(), func i = (i, buffer.get(i)));
        let sorted = Array.sort<(Nat, Nat)>(indices, func(pair1, pair2) = Nat.compare(pair1.1, pair2.1));
        let duplicates = Buffer.Buffer<(Nat, Nat)>(size);
        var i = 0;

        while (i < size) {
            var j = i;
            var minIndex = sorted[j];
            label duplicatesLoop while (j < (size - 1 : Nat)) {
                let pair1 = sorted[j];
                let pair2 = sorted[j + 1];
                if (Nat.equal(pair1.1, pair2.1)) {
                    if (pair2.0 < pair1.0) {
                        minIndex := pair1;
                    };
                    j += 1;
                } else break duplicatesLoop;
                
            };
            duplicates.add(minIndex);
            i := j + 1;
        };

        duplicates.sort(func(pair1, pair2) = Nat.compare(pair1.0, pair2.0));
        buffer.clear();
        buffer.reserve(duplicates.size());
        for ((_, x) in duplicates.vals()) {
            buffer.add(x);
        };
        Buffer.toArray(buffer);
    };

    // challenge 6
    public query func convert_to_binary(n : Nat) : async Text {
        if (n == 0) return "0";
        var bits = "";
        var num = n;
        while (num > 0) {
            if (num % 2 == 0) bits := "0" # bits else bits := "1" # bits;
            num := num / 2;
        };
        bits;
    };
}