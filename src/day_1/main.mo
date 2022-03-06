import Array "mo:base/Array";
import Iter "mo:base/Iter";

actor {
    var counter : Nat = 0;
    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };
    public func add(n : Nat, m : Nat) : async Nat {
        return n + m;
    };
    public func square(n : Nat) : async Nat {
        return n * n;
    };
    public func days_to_second(n : Nat) : async Nat {
        return n * 86400;
    };
    public func increment_counter(n : Nat) : async Nat {
        counter := counter + n;
        return counter;
    }; 
    public func clear_counter() {
        counter := 0;
    };
    public func divide(m : Nat, n : Nat) : async Bool {
        let a : Nat =  m % n;
        if(a == 0) {
            return true;
        } else {
            return false;
        }
    }; 
    public func is_even(n : Nat) : async Bool {
        let a : Nat =  n % 2;
        if(a == 0) {
            return true;
        } else {
            return false;
        }
    };
    public func sum_of_array(array : [Nat]) : async Nat {
        var sum : Nat = 0;
        for (value in array.vals()){
            sum := sum + value;
        };
        return sum;
    };
    public func maximum(array : [Nat]) : async Nat {
        var max : Nat = 0;
        for (value in array.vals()){
            if(value > max) {
                max := value;
            };
        };
        return max;
    };
    public func remove_from_array(array : [Nat], n : Nat) : async [Nat] {
        return(Array.filter(array, func(val: Nat) : Bool { return(n != val); }));
    };
    public func selection_sort(array : [Nat]) : async [Nat] {
        var n : Nat = array.size();
        let arr : [var Nat] = Array.thaw<Nat>(array);
        var iMin : Nat = 0;
        var temp : Nat = 0;
        for (j in Iter.range(0, n - 1)) {    
            iMin := j;
            for (i in Iter.range(j + 1, n - 1)) {    
                if(arr[i] < arr[iMin]) {
                    iMin := i;
                }; 
            };
            if(iMin != j) {
                temp := arr[j];
                arr[j] := arr[iMin];
                arr[iMin] := temp;
            }; 
        }; 
        return Array.freeze<Nat>(arr);    
    };
};
