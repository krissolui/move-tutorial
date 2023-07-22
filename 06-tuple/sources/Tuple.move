module 0x42::Tuple {
    public fun tuple_0(): () {
        ()
    }
    public fun tuple_1(): (u8) {
        let tuple: (u8) = (17);
        return tuple
    }

    public fun tuple_2(): (u8, vector<u8>, bool) {
        return (17, b"Neon", false)
    }

    #[test]
    fun test_tuple_1() {
        let tuple = tuple_1();
        assert!(tuple == 17, 1);
    }

    #[test]
    fun test_tuple_2() {
        let (age, name, male) = tuple_2();
        assert!(age == 17, 1);
        assert!(name == b"Neon", 1);
        assert!(!male, 1);
    }
}