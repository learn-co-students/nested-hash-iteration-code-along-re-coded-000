require_relative 'spec_helper'
require_relative '../lib/contacts.rb'


describe "#remove_strawberry" do 

  contacts = {
    "Jon Snow" => {
      name: "Jon",
      email: "jon_snow@thewall.we", 
      favorite_icecream_flavors: ["chocolate", "vanilla"],
      knows: nil
    },
    "Freddy Mercury" => {
      name: "Freddy",
      email: "freddy@mercury.com",
      favorite_icecream_flavors: ["strawberry", "cookie dough", "mint chip"]
    }
  }

  it "removes the strawberry ice cream from :favorite_icecream_flavors" do 
    result = remove_strawberry(contacts)
    expect(result["Freddy Mercury"][:favorite_icecream_flavors]).to_not include("strawberry")
  end
end