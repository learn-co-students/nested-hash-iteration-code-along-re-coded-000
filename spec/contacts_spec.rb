require_relative 'spec_helper'
require_relative '../lib/contacts.rb'


describe "#remove_strawberry" do
  let :contacts do
    {
      "Jon Snow" => {
        name: "Jon",
        email: "jon_snow@thewall.we",
        favorite_ice_cream_flavors: ["chocolate", "vanilla"]
      },
      "Freddy Mercury" => {
        name: "Freddy",
        email: "freddy@mercury.com",
        favorite_ice_cream_flavors: ["strawberry", "cookie dough", "mint chip"]
      }
    }
  end

  it "removes the strawberry ice cream from :favorite_ice_cream_flavors" do
    result = remove_strawberry(contacts)
    expect(result["Freddy Mercury"][:favorite_ice_cream_flavors]).to_not include("strawberry")
  end
end
