import Array "mo:base/Array";
actor {
    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };
    //Challenge 1 
    private func swap(array : [var Nat], j : Nat, i : Nat) : [Nat] {
        var temp : Nat = 0;
        temp := array[j];
        array[j] := array[i];
        array[i] := temp;
        return Array.freeze<Nat>(array);
    };
    //Challenge 2
    public func init_count(n : Nat) : async [Nat] {
        return Array.tabulate<Nat>(n, func (i) {
            i;
        });
    };
    //Challenge 3
    public func seven(array : [Nat]) : async Text {
        var n : ?Nat = Array.find<Nat>(array, func(val : Nat) : Bool { return(val == 7); });
        switch (n) {
            case null return "Seven not found";
            case (?n) return "Seven is found";
        } 
    }; 
    //Challenge 4
    public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
        switch (n) {
            case null return m;
            case (?n) return n;
        } 
    };
    //Challenge 5
    public func day_of_the_week(n : Nat) : async ?Text {
        if(n == 1) { return ?"Monday"; };
        if(n == 2) { return ?"Tuesday"; };
        if(n == 3) { return ?"Wednesday"; };
        if(n == 4) { return ?"Thursday"; };
        if(n == 5) { return ?"Friday"; };
        if(n == 6) { return ?"Saturday"; };
        if(n == 7) { return ?"Sunday"; };
        return null;
    };
    //Challenge 6
    public func populate_array(array : [?Nat]) : async [Nat] {
        //return array; where all null values have been replaced by 0.
        return Array.tabulate<Nat>(array.size(), func (i) {
            switch (array[i]) {
                case null 0;
                case (?n) n;
            } 
        });
    };
    //Challenge 7
    public func sum_of_array(array : [Nat]) : async Nat {
        return Array.foldLeft<Nat, Nat>(array, 0, func(b, a){ b + a; });
    };
    //Challenge 8
    public func squared_array(array : [Nat]) : async [Nat] {
        return Array.tabulate<Nat>(array.size(), func (i) {
            array[i] * array[i];
        });
    };
    //Challenge 9
    public func increase_by_index(array : [Nat]) : async [Nat] {
        return Array.tabulate<Nat>(array.size(), func (i) {
            array[i] + i;
        });
    };
    //Challenge 10
    func contains<A>(arr : [A], a : A, f : (A,A) -> Bool) : Bool {
        var b : Bool = false;
        for(i in arr.vals()) {
            if (f(i,a)) {
                b := true;
            };
        };
        b;
    };
        
};
