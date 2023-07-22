module 0x42::Generic {
    use std::vector;

    struct GenericStruct<T> has drop {
        name: vector<u8>,
        list: vector<T>
    }

    public fun new_num(): GenericStruct<u8> {
        return GenericStruct {
            name: b"numbers",
            list: vector::empty<u8>()
        }
    }

    public fun new_str(): GenericStruct<vector<u8>> {
        return GenericStruct {
            name: b"strings",
            list: vector::empty<vector<u8>>()
        }
    }

    public fun add_to_list<T>(obj: &mut GenericStruct<T>, item: T): &mut GenericStruct<T> {
        vector::push_back(&mut obj.list, item);
        return obj
    }

    #[test]
    fun test_new_num() {
        let numbers = new_num();
        assert!(numbers.name == b"numbers", 1);

        add_to_list(&mut numbers, 23);
        add_to_list(&mut numbers, 92);
        add_to_list(&mut numbers, 46);
        assert!(vector::length(&numbers.list) == 3, 1);
        assert!(*vector::borrow(&numbers.list, 0) == 23, 1);
        assert!(*vector::borrow(&numbers.list, 1) == 92, 1);
        assert!(*vector::borrow(&numbers.list, 2) == 46, 1);
    }

    #[test]
    fun test_new_str() {
        let strings = new_str();
        assert!(strings.name == b"strings", 1);

        add_to_list(&mut strings, b"learn");
        add_to_list(&mut strings, b"move");
        add_to_list(&mut strings, b"for");
        add_to_list(&mut strings, b"aptos");
        assert!(vector::length(&strings.list) == 4, 1);
        assert!(*vector::borrow(&strings.list, 0) == b"learn", 1);
        assert!(*vector::borrow(&strings.list, 1) == b"move", 1);
        assert!(*vector::borrow(&strings.list, 2) == b"for", 1);
        assert!(*vector::borrow(&strings.list, 3) == b"aptos", 1);
    }
}