module 0x42::Integer {
    public fun addition(a: u8, b: u8): u8 {
        return a + b
    }

    public fun subtraction(a: u8, b: u8): u8 {
        assert!(a >= b, 0);
        return a - b
    }

    public fun multiplication(a: u8, b: u8): u8 {
        return a * b
    }

    public fun division(a: u8, b: u8): u8 {
        assert!(a >= b, 0);
        return a / b
    }

    public fun modular(a: u8, b: u8): u8 {
        assert!(a >= b, 0);
        return a % b
    }

    public fun shift_right(num: u16, digit: u8): u16 {
        return num >> digit
    }

    public fun shift_left(num: u16, digit: u8): u16 {
        return num << digit
    }

    #[test]
    fun test_addition() {
        let ans = addition(8, 13);
        assert!(ans == 21, 1);
    }

    #[test]
    fun test_subtraction() {
        let ans = subtraction(19, 8);
        assert!(ans == 11, 1);
    }

    #[test]
    fun test_multiplication() {
        let ans = multiplication(11, 12);
        assert!(ans == 132, 1);
    }

    #[test]
    fun test_division() {
        let ans = division(13, 4);
        assert!(ans == 3, 1);
    }

    #[test]
    fun test_modular() {
        let ans = modular(13, 4);
        assert!(ans == 1, 1);
    }

    #[test]
    fun test_shift_right() {
        let ans = shift_right(1764, 3);
        assert!(ans == 220, 1);
    }

    #[test]
    fun test_shift_left() {
        let ans = shift_left(1764, 3);
        assert!(ans == 14112, 1);
    }
}