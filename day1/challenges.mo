actor {
    // challenge 1
    public query func multiply(n : Nat, m : Nat) : async Nat {
        n * m;
    };

    // challenge 2
    public query func volume(n : Nat) : async Nat {
        n ** 3;
    };

    // challenge 3
    public query func hours_to_minutes(n : Nat) : async Nat {
        n * 60;
    };

    // challenge 4
    stable var count : Nat = 0;

    public func set_counter(n : Nat) : async () {
        count := n;
    };

    public query func get_counter() : async Nat {
        count;
    };

    // challenge 5
    public query func test_divide(n: Nat, m : Nat) : async Bool {
        n % m == 0;
    };

    // challenge 6
    public query func is_even(n : Nat) : async Bool {
        n % 2 == 0;
    };
}