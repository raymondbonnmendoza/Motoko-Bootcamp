import Result "mo:base/Result";
//Bonus : intercanister calls.
//Challenge 8 : Create another canister and use to mint a NFT by calling the mint method of your first canister.
actor {

    let other_canister : actor { mint : () -> async Result.Result<(), Text>} = actor("rrkah-fqaaa-aaaaa-aaaaq-cai");
    public func call_mint() : async Result.Result<(), Text> {
        return(await other_canister.mint())
    };
}
