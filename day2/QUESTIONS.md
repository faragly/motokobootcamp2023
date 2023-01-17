1. NNS controls the Ledger canister.
2. mwrha-maaaa-aaaab-qabqq-cai is the backend canister of Motoko Playground. Application subnet with 16 machines
https://dashboard.internetcomputer.org/canister/mwrha-maaaa-aaaab-qabqq-cai
https://icscan.io/subnet/pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe
3. 11.95
4. 
1)
```
import Nat "mo:base/Nat";
import Text "mo:base/Text";
```
2) unused variables n and t
3) should add query
5. 
1) immutable array expression cannot produce expected type
The variable 'languages' and values are mutable, but never mutates
```
let languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];
```
2) A shared function can't return mutable array, should use Array.freeze and query
6. Array.append is deprecated
```
public func add_language(new_language: Text) : async [Text] {
    let buffer = Buffer.fromArray<Text>(languages);
    buffer.add(new_language);
    languages := Buffer.toArray(buffer);
    languages;
};
```