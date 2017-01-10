require 'pry'

  # This is the array we will be passing into the remove_strawberry method
  contacts = {
     "Jon Snow" => {
       name: "Jon",
       email: "jon_snow@thewall.we",
       favorite_icecream_flavors: ["chocolate", "vanilla"]
     },
     "Freddy Mercury" => {
       name: "Freddy",
       email: "freddy@mercury.com",
       favorite_icecream_flavors: ["strawberry", "cookie dough", "mint chip"]
     }
   }

   def remove_strawberry(contacts)
   contacts.each do |key1, value1|
     value1.each do |key2, value2|
       if key2 == :favorite_icecream_flavors
         value2.delete_if{|ice_cream| ice_cream == "strawberry"}
       end
     end
   end
   end
