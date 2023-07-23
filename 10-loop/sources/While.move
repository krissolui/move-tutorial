module 0x42::While {
    public fun partial_sum(n: u8): u64 {
        let i = 1;
        let sum: u64 = 0;
        while (i <= n) {
            sum = sum + (i as u64);
            i = i + 1;
        };

        return sum
    }

    public fun skip_threes(n: u8): u64 {
        let i = 0;
        let sum: u64 = 0;
        while (i < n) {
            i = i + 1;
            if (i % 3 == 0) continue;
            sum = sum + (i as u64);
        };

        return sum
    }

    public fun find_smallest_divisor(n: u8): u8 {
        assert!(n > 2, 0);
        let divisor = 2;
        while (divisor <= n) {
            if (n % divisor == 0) break;
            divisor = divisor + 1;
        };

        return divisor
    }

    #[test]
    fun test_partial_sum() {
        let sum = partial_sum(10);
        assert!(sum == 55, 1);
    }

    #[test]
    fun test_skip_threes() {
        let sum = skip_threes(10);
        assert!(sum == 37, 1);
    }

    #[test]
    fun test_find_smallest_divisor() {
        let divisor = find_smallest_divisor(35);
        assert!(divisor == 5, 1);
    }
}