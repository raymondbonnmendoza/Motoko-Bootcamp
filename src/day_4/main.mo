import Person "person";
import Card "custom";
import Animal "animal";
import List "mo:base/List";

actor {
    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };
    public type Person = Person.Person;
    let penelope : Person = {
        name = "Penelope Cruz";
        age = 47;
    };
    //Challenge 1
    public func fun () : async Card.Card {
        return { suite = "Club"; number = 5; };
    };

    //Challenge 2
    var animal : Animal.Animal = { specie = "Bird"; energy = 100; };

    //Challenge 4
    public func create_animal_then_takes_a_break(s : Text, e : Nat) : async Animal.Animal {
        return Animal.animal_sleep( { specie = s; energy = e; } );
    }; 
    
    //Challenge 5
    var aList = List.nil<Animal.Animal>() : List.List<Animal.Animal>;

    //Challenge 6
    func push_animal(a : Animal.Animal) : () {
        aList := List.push<Animal.Animal>(a, aList);
    };
    func get_animals() : [Animal.Animal] {
        return List.toArray<Animal.Animal>(aList); 
    }; 
   
};
