import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Prim "mo:⛔";
import Cycles "mo:base/ExperimentalCycles";

shared ({ caller = creator }) actor class MyCanister() = {

    let owner : Principal = creator;

    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };
    //Challenge 1 : 
    private let anonymousPrincipal : Blob = "\04";
    public shared({caller}) func is_anonymous() : async Bool {
        return Prim.blobOfPrincipal caller == anonymousPrincipal;
    };

    //Challenge 2
    let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);
    //Challenge 3 & 4
    public shared({caller}) func add_favorite_number(n : Nat) : async Text {
        switch (favoriteNumber.get(caller)) {
            case null favoriteNumber.put(caller, n);         
            case (?n) return "You've already registered your number";
        };
        return "You've successfully registered your number";
    };
    public shared({caller}) func show_favorite_number() : async ?Nat {
        return favoriteNumber.get(caller); 
    };
    //Challenge 5
    public shared({caller}) func update_favorite_number(n : Nat) : async Text {
        favoriteNumber.put(caller, n);
        return "Your number has been updated";
    };
    public shared({caller}) func delete_favorite_number() : async Text {
        favoriteNumber.delete(caller);
        return "Your number has been deleted";
    };
    //Challenge 6
    public shared({caller}) func deposit_cycles() : async Nat {
        if (caller != owner) {
           return Cycles.accept(Cycles.available());
        } else {
            return 0;
        }
    };

    //Challenge 8
    stable var counter : Nat = 0;
    public func increment_counter(n : Nat) : async Nat {
        counter := counter + n;
        return counter;
    }; 
    public func clear_counter() {
        counter := 0;
    };
    
    stable var version_number : Nat = 0;
    system func postupgrade() {
        version_number := version_number + 1;
    };

    //Challenge 9 : In a new file, copy and paste the functionnalities you've created in challenges 2 to 5. This time the hashmap and all records should be preserved accross upgrades.
    
    //Challenge 10 (optionale) : In autonomy, write a CRUD canister, you can add as much functionnalities as you want, a few examples :
        //Anonymous principal rejection.
        //Cycle functionnality for registration.
        //Admin management.
};
