require 'rspec'
require 'pry'
require_relative '../memory_key_value_store'

describe "MemoryKeyValueStore" do

  let(:store) {MemoryKeyValueStore.new}
  
  describe "#get" do
    context "with a matching key" do
      it "gets the value of key" do
        key = 'foo'
        value = 'bar'
        store.set(key, value)
        expect(store.get(key)).to be(value)
      end
    end

    context "without a matching key" do
      it "returns the special value nil" do
        key = 'nonexistant'
        expect(store.get(key)).to be(nil)
      end
    end

    context "with a non-string value" do
      it "returns an error" do
        key = 1
        expect { store.get(key) }.to raise_error(StandardError)
      end
    end
  end

  describe "#set" do
    context "when they key does not hold a value" do
      it "sets the key to hold the string value" do
        key = 'foo'
        value = 'bar'
        store.set(key, value)
        expect(store.get(key)).to be(value)
      end
      it "returns the string 'OK'" do
        key = 'foo'
        value = 'bar'
        success = "OK"
        expect(store.set(key, value)).to eql(success)
      end
    end

    context "when they key already holds a value" do
      it "sets the key to hold the string value" do
        key = 'foo'
        value = 'bar'
        store.set(key, value)
        expect(store.get(key)).to be(value)
        value = 'quux'
        store.set(key, value)
        expect(store.get(key)).to be(value)
      end
      it "returns the string 'OK'" do
        key = 'foo'
        value = 'bar'
        store.set(key, value)
        expect(store.get(key)).to be(value)
        value = 'quux'
        success = "OK"
        expect(store.set(key, value)).to eql(success)
      end
    end
  end

  describe "#keys" do
    let(:options) { {'foo' => 'bar', 'foo1' => 'bar1'} }
    let(:store) {MemoryKeyValueStore.new(options)}
    context "when no regex pattern is passed" do
      it "returns all keys" do
        expect(store.keys.sort).to eql(options.keys.sort)
      end
    end

    context "when a regex pattern is passed" do
      it "returns all keys matching regex pattern" do
        expect(store.keys(/foo/).sort).to eql(store.keys.sort)
      end
    end
  end
end
