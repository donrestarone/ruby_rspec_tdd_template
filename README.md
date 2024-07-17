# a Ruby Template for TDD with Rspec

## Usage

1. clone repository
2. Run tests at root level for testing the poro.rb
3. See examples: memory_key_value_store.rb

## Cheatsheet

To run a specific test, indicate the line number

``` bash
rspec examples/memory_key_value_store/spec/memory_key_value_store_spec.rb:10
```
to run a specific file, point to the file
``` bash
rspec spec/poro_spec.rb
```

to run all tests under /spec

``` bash
rspec spec
```
