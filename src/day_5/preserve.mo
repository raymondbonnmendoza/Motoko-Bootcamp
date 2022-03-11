//Challenge 9
module {
    //Challenge 2
    stable var favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);
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
}