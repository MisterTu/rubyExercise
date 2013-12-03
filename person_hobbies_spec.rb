require "rspec"
require "./person"
describe Person do
  describe "Person initialization" do

    it "should have a name" do
      p = Person.new
      p.name = "Donald"
      expect(p.name).to eq "Donald"
    end
    it "should have a setter for arrays" do
      p = Person.new
      p.hobbies = "a,b,c"
      expect(p.hobbies).to eq ["a","b","c"]
    end
    it "should initialize it's fields from a hash" do

      argument_hash = {name: "Dagobert",hobbies: "Money,Bathing"}
      p = Person.new(argument_hash)
      p.name.should == "Dagobert"
      expect(p.hobbies).to eq ["Money", "Bathing"]

    end

    it "should raise an UnknownAttributeError if a field is unknown" do
      argument_hash =   {:name => "Dagobert", :hobbies => "Money",:nonexistentfield => "some Value"}
      expect { p = Person.new(argument_hash) }.to raise_error(UnknownAttributeError)
    end

    it "should still be initializable without any parameters" do
      p = Person.new
    end
  end
  describe "hobby sharing" do
    it "returns intersection of hobbies" do
      p1 = Person.new(name: "Dagobert",hobbies: "Money,Bathing")
      p2 = Person.new(name: "Donald",hobbies: "Bathing")
      expect(p1.commonHobbies(p2)).to eq ["Bathing"]
    end
    it "returns a list of best friends" do
      p1 = Person.new(name: "Hans",hobbies: "Diving")
      p2 = Person.new(name: "Dagobert1",hobbies: "Money,Bathing,Knitting")
      p3 = Person.new(name: "Dagobert2",hobbies: "Money,Bathing")
      p4 = Person.new(name: "Donald",hobbies: "Bathing")
      a = [p1,p2,p3,p4]
      result = p1.friendslist(a)
      expect(result[0]).to eq [2,"Money, Bathing","Dagobert1","Dagobert2"]
      expect(result).to include([1,"Bathing","Dagobert2","Donald"])
      expect(result.length).to eq 3
    end
  end
end
