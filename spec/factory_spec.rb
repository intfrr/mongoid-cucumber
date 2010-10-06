require "spec_helper"

describe Mongoid::Cucumber::Factory do

  class Person
    include Mongoid::Document
    field :title, :type => String
    field :dob, :type => Date
  end

  let(:klass) do
    Mongoid::Cucumber::Factory
  end

  describe ".create" do

    context "when provided a table with one row" do

      let(:table) do
        Cucumber::Ast::Table.new([
          %w{title dob},
          %w{Sir 1976/10/31}
        ])
      end

      let(:document) do
        klass.create("person", table)
      end

      it "returns a single document" do
        document.should be_a(Person)
      end

      it "sets strings" do
        document.title.should == "Sir"
      end

      it "sets dates" do
        document.dob.should == Date.new(1976, 10, 31)
      end
    end
  end
end
