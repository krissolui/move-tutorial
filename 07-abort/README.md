`assert` will be replaced by the `abort` expression in the compiler.

-   The following examples are equivalent.

```rust
fun sample1(x: bool) {
    assert!(x, 0);
}
```

```rust
fun sample2(x: bool) {
    if (x) () else abort 0;
}
```
