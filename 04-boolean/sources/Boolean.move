module 0x42::Boolean {
    // In-line syntax
    public fun is_adult(age: u8): bool {
        let adult = if (age >= 18) true else false;
        return adult
    }

    // Block syntax
    public fun can_retire(age: u8): bool {
        let retire: bool;
        if (age >= 65) {
            retire = true;
        } else {
            retire = false;
        };
        return retire
    }

    #[test]
    fun test_is_adult_1() {
        let adult = is_adult(18);
        assert!(adult, 1);
    }

    #[test]
    fun test_is_adult_2() {
        let adult = is_adult(56);
        assert!(adult, 1);
    }

    #[test]
    fun test_is_adult_3() {
        let adult = is_adult(12);
        assert!(!adult, 1);
    }

    #[test]
    fun test_can_retire_1() {
        let retire = can_retire(79);
        assert!(retire, 1);
    }

    #[test]
    fun test_can_retire_2() {
        let retire = can_retire(65);
        assert!(retire, 1);
    }

    #[test]
    fun test_can_retire_3() {
        let retire = can_retire(21);
        assert!(!retire, 1);
    }
}