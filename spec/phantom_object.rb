require 'spec_helper'

describe PhantomObject do

  let (:hash) do
    {
      foo: 1,
      bar: "boo",
      baz: nil,
      arr: [
        {
          foo: 1,
          bar: "boo"
        },
        {
          foo: 1,
          bar: "boo"
        }
      ],
      h: {
        foo: 1,
        bar: "boo"
      }
    }
  end

  it "Should convert a hash into an object" do
    hash.should be_a(Hash)
    ob = PhantomObject.new(hash)
    ob.foo.should eq 1
    ob.bar.should eq "boo"
    ob.baz.should be_nil

    ob.arr.should be_a(Array)
    ob.arr.length.should eq 2
    ob.arr[0].foo.should eq 1
    ob.arr[0].bar.should eq "boo"
    ob.arr[1].foo.should eq 1
    ob.arr[1].bar.should eq "boo"

    ob.h.should_not be_a(Hash)
    ob.h.foo.should eq 1
    ob.h.bar.should eq "boo"
  end

  it "Should raise an exception if hash key contains whitespace" do
    expect { PhantomObject.new("a b" => 1) }.to raise_error(ArgumentError, 'Your hash has keys with whitespaces')
  end

  it "Should raise an exception if hash key begins with a capital letter" do
    expect { PhantomObject.new("Abc" => 1) }.to raise_error(ArgumentError, 'Your hash has keys with Capital letters at the beginning')
  end

  it "Should add a converter method to_object to Hash" do
    hash.should be_a(Hash)
    hash.should respond_to(:to_object)
    ob = hash.to_object
    ob.foo.should eq 1
    ob.bar.should eq "boo"
    ob.baz.should be_nil

    ob.arr.should be_a(Array)
    ob.arr.length.should eq 2
    ob.arr[0].foo.should eq 1
    ob.arr[0].bar.should eq "boo"
    ob.arr[1].foo.should eq 1
    ob.arr[1].bar.should eq "boo"

    ob.h.should_not be_a(Hash)
    ob.h.foo.should eq 1
    ob.h.bar.should eq "boo"
  end
end