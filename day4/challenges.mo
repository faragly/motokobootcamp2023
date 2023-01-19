import Bool "mo:base/Bool";
import Principal "mo:base/Principal";
import Iter "mo:base/Iter";
import HashMap "mo:base/HashMap";

actor {
    // challenge 3
    public query ({ caller }) func is_anynomous() : async Bool {
        Principal.isAnonymous(caller);
    };

    // challenge 5
    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);
    
    public query func get_usernames() : async [(Principal, Text)] {
        Iter.toArray(usernames.entries());
    };
}