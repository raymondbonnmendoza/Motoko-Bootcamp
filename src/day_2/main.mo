import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
actor {
    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };
    public func nat_to_nat8(n : Nat) : async Nat8 {
        if(n > 255) {
            return 255;
        } else {
            return(Nat8.fromNat(n));
        };
    }; 
    public func max_number_with_n_bits(n : Nat) : async Nat {
        return(Nat.pow(2,n));
    };
    public func decimal_to_bits(n : Nat) : async Text {
        var q : Nat = n;
        var b : Text = "";
        while (q != 0) {
            b := Nat.toText(q % 2) # b;
            q := q / 2;
        };
        return b;
    };
    public func capitalize_character(c : Char) : async Text {
        var n : Nat32 = Char.toNat32(c);
        if(Char.isLowercase(c)) {
            return(Char.toText(Char.fromNat32(n - 32))); 
        } else { 
            if(Char.isUppercase(c)) {
                return(Char.toText(c));
            } else { 
                return "Cannot capitalize"; 
            }
        }; 
     };
     func _capitalize_character(c : Char) : Text {
        var n : Nat32 = Char.toNat32(c);
        if(Char.isLowercase(c)) {
            return(Char.toText(Char.fromNat32(n - 32))); 
        } else { 
            if(Char.isUppercase(c)) {
                return(Char.toText(c));
            } else { 
                return "Cannot capitalize"; 
            }
        }; 
     };
    public func capitalize_text(t : Text) : async Text {
        var i : Text = "";
        var j : Text = "";
        for(char in t.chars()){
            i := _capitalize_character(char);
            j := j # i;
        };
        return j;
    };
    public func is_inside(t : Text, c : Char) : async Bool {
        var n : Bool = false;
        for(char in t.chars()){
            if(char == c) {
                n := true;
            };
        };
        return n;
    };
    public func trim_whitespace(t : Text) : async Text {
        return(Text.trim(t, #text " "));
    };
    public func duplicated_character(t : Text)  : async Text {
        var c : Nat = 0;
        for(char1 in t.chars()){
            c := 0;
            for(char2 in t.chars()){
                if(char1 == char2){
                    c := c + 1;
                    if(c == 2){
                        return Char.toText(char2);
                    };
                };
            };    
        };
        return t;
    };
    public func size_in_bytes(t : Text) : async Nat {
        return Text.encodeUtf8(t).size();
    };
    public func bubble_sort(array : [Nat]) : async [Nat] {
        var n : Nat = array.size();
        let arr : [var Nat] = Array.thaw<Nat>(array);
        var temp : Nat = 0;
        for (i in Iter.range(1, n - 1)) {    
            for (j in Iter.range(0, n - 2)) {    
                if(arr[j] > arr[j + 1]) {
                    temp := arr[j];
                    arr[j] := arr[j + 1];
                    arr[j + 1] := temp;
                }; 
            };
        }; 
        return Array.freeze<Nat>(arr);
    };
};  
