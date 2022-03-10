module {
    //Challenge 2
    public type Animal = {
        specie : Text;
        energy : Nat;
    };

    //Challenge 3
    public func animal_sleep(a : Animal) : Animal {
        { specie = a.specie;
          energy = a.energy + 10; };
    };
}