module 0x42::Vector {
    use std::vector;

    struct SomeThing has copy, drop {
        name: vector<u8>
    }

    public fun int_vec(): vector<u8> {
        return vector[0, 1, 2, 4, 8, 16, 32, 64, 128]
    }

    public fun str_vec(): vector<vector<u8>> {
        return vector[
            b"this",
            b"is",
            b"a",
            b"list",
            b"of",
            b"strings"
        ]
    }

    public fun struct_vec(): vector<SomeThing> {
        return vector[
            SomeThing { name: b"some name" }
        ]
    }

    #[test]
    fun test_int_vec() {
        let vec = int_vec();
        let length = vector::length(&vec);
        assert!(length == 9, 1);
        assert!(*vector::borrow(&vec, length - 1) == 128, 1);
    }

    #[test]
    fun test_str_vec() {
        let vec = str_vec();
        let length = vector::length(&vec);
        assert!(length == 6, 1);
        assert!(*vector::borrow(&vec, 3) == b"list", 1);
        assert!(vector::contains(&vec, &b"of"), 1);
    }

    #[test]
    fun test_struct_vec() {
        let vec = struct_vec();
        let length = vector::length(&vec);
        assert!(length == 1, 1);
        vector::insert(&mut vec, SomeThing { name: b"insert 0"}, 0);
        length = vector::length(&vec);
        assert!(length == 2, 1);
        vector::insert(&mut vec, SomeThing { name: b"insert 1"}, 1);
        length = vector::length(&vec);
        assert!(length == 3, 1);

        assert!(vector::borrow(&vec, 0).name == b"insert 0", 1);
        assert!(vector::borrow(&vec, 1).name == b"insert 1", 1);
        assert!(vector::borrow(&vec, 2).name == b"some name", 1);
    }

    #[test]
    fun test_byte_hex_string() {
        let byte_str = b"converter";
        let hex_str = x"636f6e766572746572";
        assert!(byte_str == hex_str, 1);
    }
}