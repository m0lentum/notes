See this example from <https://cliffle.com/blog/m4vga-in-rust/>:

```rust
fn fill_1024(array: &mut [u8], color: u8) {
    // Perform an explicit, checked, slice of the array before
    // entering the loop.
    let array = &mut array[..1024];

    for i in 0..1024 {
        array[i] = color;
    }
}
```

I'm not sure if this would be helpful in starframe off-hand,
but there's certainly a lot of indexing into arrays
going on in the solver