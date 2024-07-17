# Memory Key Value Store
This practical programming problem tests your ability to understand and satisfy requirements by writing a solution given an unimplemented interface in plain old Ruby. 

You'll implement a few basic functions provided by [redis-rb](https://github.com/redis/redis-rb), storing data in memory instead of Redis.
- [#set](https://redis.io/commands/set)
- [#get](https://redis.io/commands/get)
- [#keys](https://redis.io/commands/keys)

After satisfying the written requirements you'll be asked to adapt your code to satisfy an additional verbal requirement in a subsequent iteration.

## Guidelines

Please follow your normal development process. If you normally practice TDD, go ahead and write tests first. If you normally sketch out a solution and write tests afterwards, go ahead and start sketching. Please do not alter your normal development process for the sake of the interview!

## Getting Started

### Software Instructions
The question requires Ruby version 2.2.2 or above: [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)

### Install requirements
```
bundle
```
Will install Ruby specification library `rspec`.

### Read the specification
```
bundle exec rspec
```
Will output the specification as pending tests. You'll see output such as:

```
  1) MemoryKeyValueStore #get with a matching key gets the value of key
     # Not yet implemented
  ...
```

### Write implementation

Edit the file `memory_key_value_store.rb` to implement the functionality to satisfy the specification.

