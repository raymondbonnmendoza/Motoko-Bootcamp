import Cycles "mo:base/ExperimentalCycles";
import Principal "mo:base/Principal";

shared ({ caller = creator }) actor class MyCanister (day_5Canister : Principal) = {

    //Challenge 7
    public shared ({ caller }) func withdraw_cycles(n : Nat) : async Nat {
        let day_5 : actor { deposit_cycles : () -> async Nat; } = actor(Principal.toText(day_5Canister));
        Cycles.add(n);
        let deposit = await day_5.deposit_cycles();
        deposit;
    };
};