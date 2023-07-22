module 0x42::Abort {
    const MIN_AGE: u8 = 18;
    public fun is_adult_abort(age: u8): bool {
        if (age < MIN_AGE) abort 0;
        return true
    }

    public fun is_adult_assert(age: u8): bool {
        assert!(age >= MIN_AGE, 0);
        return true
    }

    #[test]
    fun test_is_adult_abort() {
        let ans = is_adult_abort(17);
        assert!(ans, 1);
    }

    #[test]
    fun test_is_adult_assert() {
        let ans = is_adult_assert(17);
        assert!(ans, 1);
    }
}