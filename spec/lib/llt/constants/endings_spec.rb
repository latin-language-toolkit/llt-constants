require 'spec_helper'

describe LLT::Constants::Endings do
  let(:endings) { LLT::Constants::Endings }

  describe "::Noun" do
    describe ".get" do
      it "retrieves endings by inflection_class and sexus, which may default to nil" do
        endings::Noun.get(1).should == endings::Noun::A
        endings::Noun.get(2, :n).should == endings::Noun::ON
      end
    end
  end

  describe "::Adjective" do
    describe ".get" do
      it "retrieves endings by inflection_class, noe and comparatio value" do
        endings::Adjective.get(5, 3, :positivus).should == endings::Adjective::PRONOMINAL
        endings::Adjective.get(3, 1, :comparativus).should == endings::Adjective::CONSONANTIC
      end
    end
  end
end
