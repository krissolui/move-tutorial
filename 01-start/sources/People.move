module 0x42::SocialNetwork {
    use std::debug;

    struct Person has drop {
        name: vector<u8>,
        age: u8
    }
    
    public fun set_age(age: u8) : u8 {
        let person = Person {
            name: b"Move",
            age: age
        };

        person.age
    }

    #[test]
    fun test_set_age() {
        let age = set_age(10);
        debug::print(&age);
        assert!(age == 10, 0);
    }
}