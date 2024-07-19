require 'rspec'
require 'pry'
require_relative '../text_manipulator'

describe TextManipulator do  
  it "is available as the described_class" do
    expect(described_class).to be(TextManipulator)
  end

  it "can be initialized with a a text body and commands for text manipulation" do
    corpus = "hello world"
    commands = "hhlhllhlhhll"
    instance = described_class.new(corpus, commands)
    expect(instance.corpus).to eql(corpus)
    expect(instance.commands).to eql(commands)
  end

  it 'performs expected manipulation for hhlhllhlhhll' do
    corpus = "Hello World"
    commands = "hhlhllhlhhll"
    instance = described_class.new(corpus, commands)

    expect(instance.call).to eql({cursor: 2, output_string: corpus})
  end

  it 'performs expected manipulation for rhllllllrw' do
    corpus = "Hello World"
    commands = "rhllllllrw"
    instance = described_class.new(corpus, commands)

    expect(instance.call).to eql({cursor: 6, output_string: "hello world"})
  end

  it 'performs expected manipulation for rh6l9l4hrw' do
    corpus = "Hello World"
    commands = "rh6l9l4hrw"
    instance = described_class.new(corpus, commands)

    expect(instance.call).to eql({cursor: 6, output_string: "hello world"})
  end

  it 'performs expected manipulation for 1rhll2rL' do
    corpus = "Hello World"
    commands = "1rhll2rL"
    instance = described_class.new(corpus, commands)

    expect(instance.call).to eql({cursor: 3, output_string: "heLLo World"})
  end
end
