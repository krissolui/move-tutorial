module 0x42::Destruction {
    struct Example has copy, drop {
        x: u64,
        y: bool,
        z: vector<u8>
    }

    struct Wrapper has drop {
        a: Example,
        b: Example
    }

    public fun new_example(year: u64): Example {
        Example {
            x: year,
            y: year == 2023,
            z: b"Happy coding"
        }
    }

    public fun new_wrapper(a: Example, b: Example): Wrapper {
        Wrapper {
            a,
            b
        }
    }

    #[test]
    fun test_new_example() {
        let example1 = new_example(2023);
        let Example {x: year, y: is_2023, z: text} = example1;
        assert!(year == 2023, 1);
        assert!(is_2023, 1);
        assert!(text == b"Happy coding", 1);

        let example2 = new_example(2021);
        let Example {x: year, y: is_2023, z: text} = example2;
        assert!(year == 2021, 1);
        assert!(!is_2023, 1);
        assert!(text == b"Happy coding", 1);

        let Wrapper {a, b} = new_wrapper(example1, example2);
        assert!(a.x == 2023, 1);
        assert!(a.y, 1);
        assert!(a.z == b"Happy coding", 1);
        assert!(b.x == 2021, 1);
        assert!(!b.y, 1);
        assert!(b.z == b"Happy coding", 1);
    }
}