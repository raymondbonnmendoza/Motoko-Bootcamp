
import HTTP "http";
import Result "mo:base/Result";
import Iter "mo:base/Iter";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Principal "mo:base/Principal";
import List "mo:base/List";
import Nat "mo:base/Nat";
import Prim "mo:⛔";
import Text "mo:base/Text";

actor {
    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };
    //Challenge 1
    type TokenIndex = Nat;
    type Error = {
        #Unauthorized;
        #Unknown;
    };
    //Challenge 2
    let registry = HashMap.HashMap<TokenIndex, Principal>(0, Nat.equal, Hash.hash);

    //Challenge 3 & 7 
    stable var nextTokenIndex : Nat = 0; 
    private let anonymousPrincipal : Blob = "\04";
    private func is_anonymous(principal : Principal) : Bool {
        return Prim.blobOfPrincipal principal == anonymousPrincipal;
    };
    public shared ({caller}) func mint() : async Result.Result<(), Text> {
        var anon : Bool = is_anonymous(caller);
        if(anon){
            return #err("You need to be authenticated to mint");
        } else {
            registry.put(nextTokenIndex, caller); 
            nextTokenIndex := nextTokenIndex + 1;  
            return #ok;
        }
    };
    
    //Challenge 4 : 
    public shared ({caller}) func transfer(to : Principal, tokenIndex : Nat) : async Result.Result<(), Text> {
        var anon : Bool = is_anonymous(caller);
        if(anon) { 
            return #err("You need to be authenticated to mint"); 
        } else {
            if(tokenIndex >= nextTokenIndex) { 
                return #err("TokenIndex does not exist"); 
            } else { 
                registry.put(tokenIndex, caller); 
                return #ok;
        }}
    };

    //Challenge 5
    public shared ({caller}) func balance() : async List.List<TokenIndex> {
        var i : TokenIndex = 0;
        var p : ?Principal = null;
        var tList = List.nil<TokenIndex>() : List.List<TokenIndex>;
        for (i in Iter.range(0, nextTokenIndex - 1)){
            p := registry.get(i);
        };
        return tList;
    }; 

    //Challenge 6 :
    public query func http_request(request : HTTP.Request) : async HTTP.Response {
        let response = {
            body = Text.encodeUtf8(Nat.toText(nextTokenIndex - 1));
            headers = [("Content-Type", "text/html; charset=UTF-8")];
            status_code = 200 : Nat16;
            streaming_strategy = null
        };
        return(response)
    }; 

    //Bonus optional (Only take on those challenges if you have nothing else to do today...)
    //Ledger canister 💰
    //Challenge 9 : In a new actor implement a function called default_account that returns the address of the subbacount 0 for the canister.
    //Challenge 10 : Write two functions :
        //balance : takes no arguments and returns the balance of icps of the canister defaul account.
        //transfer : takes
};
