require 'rspec'
require 'pry'
require_relative '../poro'

describe Poro do  
  it "is available as the described_class" do
    expect(described_class).to be(Poro)
  end

  it "can be initialized with a value" do
    instance = described_class.new({})
    expect(instance.value).to eql({})
  end
end
