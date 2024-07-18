require 'rspec'
require 'pry'
require_relative '../lru_cache'


# task

# Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

# Implement the LRUCache class:

# LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
# int get(int key) Return the value of the key if the key exists, otherwise return -1.
# void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
# The functions get and put must each run in O(1) average time complexity.

describe LRUCache do  
  it "is available as the described_class" do
    expect(described_class).to be(LRUCache)
  end

  it "initializes the LRU cache with positive size capacity" do
    max_size = 2
    cache = LRUCache.new(max_size)
    expect(cache.max_size).to be(max_size)
  end

  it "returns the value of the key if the key exists, otherwise return -1" do
    max_size = 2 
    cache = LRUCache.new(max_size)
    key = 'foo'
    value = 'val'
    cache.put(key, value)
    
    expect(cache.get(key)).to be(value)
    expect(cache.get('nonexistant')).to be(-1)
  end

  it "Updates the value of the key if the key exists or adds the key-value pair to the cache" do
    max_size = 2 
    cache = LRUCache.new(max_size)
    key = 'foo'
    value = 'val'
    cache.put(key, value)
    new_value = 'val 2'
    cache.put(key, new_value)

    expect(cache.get(key)).to be(new_value)
  end

  it "evicts the least recently used key If the number of keys exceeds the capacity" do
    max_size = 2 
    cache = LRUCache.new(max_size)

    # least recently used
    key = 'foo'
    value = 'val'
    cache.put(key, value)

    key_2 = 'foo2'
    value_2 = 'val-2'
    cache.put(key_2, value_2)

    key_3 = 'foo3'
    value_3 = 'val-3'
    cache.put(key_3, value_3)
    expect(cache.get(key)).to be(-1)
  end
end
