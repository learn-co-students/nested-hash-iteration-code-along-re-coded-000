# Code Along: Manipulating Nested Hashes
##Objectives
* Become familiar with iterating through a nested hash
* Know where you are at each level of the iteration
* Modify the correct element in a nested hash

##Introduction
###Why this is important
So much of what we do in programming involves storing data in hashes. Often the hashes that we will encounter will have more than one level. As we get into the web, this will become abundantly clear. To build programs in the future, we'll absolutely need to get comfortable working with hashes. Let's get started!


##Code Along Exercise

Fork and clone this lab. You'll be coding your solution in `lib/contacts.rb`. You'll be manipulating the following hash:

```ruby
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
```

Your good buddy Freddy Mercury has recently developed a strawberry allergy! You need to delete `"strawberry"` from his list of favorite ice cream flavors. In the `remove_strawberry` method. 

* Iterate over the `contacts` hash and when you reach the key of `:favorite_icecream_flavors`, remove `"strawberry"` from the array of Freddy's favorite ice cream flavors. There are at least two ways you can accomplish this:
  * You can iterate through the hash and, when you reach the appropriate level, check to see if the key `==` ("is equal to") `:favorite_icecream_flavors`. If it does, check to see if that array contains `"strawberry"`. If it does, then delete it from the array. 
  * OR you can directly iterate over the hash that is the value of the `"Freddy Mercury"` key by calling an enumerator method in `contacts["Freddy Mercury"]`.  
**Hint:** *Use the* `.delete_if` *method to eliminate strawberry from the appropriate array.*  
**Hint:** *Remember that the* `remove_strawberry` *method needs to return the newly altered* `contacts` *hash.* 

Okay, let's go over it together.

###Step 1. Iterate over the first level
Inside the `remove_strawberry` method, let's take our first dive into the contacts hash. Then we'll throw a `binding.pry` in to see where we are.

We are going to first iterate over the top level of the hash where the keys should be the person and the values should be a hash of details about the person.

*Brief aside on variable naming: This process will be remarkably easier if you name your variables to accurately reflect the data they represent. For now, when the value we're iterating over is another hash, we will explicitly add a `_hash` to the end of the variable name (E.G. `contact_details_hash` below).*

```ruby
contacts.each do |person, contact_details_hash|
  binding.pry
end
```

In the terminal, let's hit the `pry` by running `ruby bin/contacts`, and check that our defined variables (`person` and `contact_details_hash`) match our expectations.

```bash
> person
=> "Jon Snow"
  
> contact_details_hash
=> {:name=>"Jon", :email=>"jon_snow@thewall.we", :favorite_icecream_flavors=>["chocolate", "vanilla"], :knows=>nil}
```

Excellent! They do.

###Step 2. Iterate over the second level

```ruby
contacts.each do |person, contact_details_hash|
  contact_details_hash.each do |attribute, data|
    binding.pry
  end
end
```

Again, let's check it out in the terminal. You should see:

```bash
> attribute
=> :name
  
> data
=> "Jon"
```

###Step 3. Locate the element we're looking for
```ruby
contacts.each do |person, contact_details_hash|
  contact_details_hash.each do ||
    if attribute == :favorite_icecream_flavors
      binding.pry
    end
  end
end
```

What is `data` when we hit the binding? If it's unclear, check it out in the terminal. 

###Step 4. Update the hash

Lastly, we will use `delete_if` to iterate through the ice cream array and remove any element that matches "strawberry":

```ruby
contacts.each do |person, contact_details_hash|
  contact_details_hash.each do ||
    if attribute == :favorite_icecream_flavors
      data.delete_if {|ice_cream| ice_cream == "strawberry"}
    end
  end
end
```

*Remember, to return the hash at the end of the method*

```ruby
def remove_strawberry
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

  contacts.each do |person, contact_details_hash|
    contact_details_hash.each do |attribute, data|
      if attribute == :favorite_icecream_flavors
        data.delete_if {|ice_cream| ice_cream == "strawberry"}
      end
    end
  end
  contacts
end
```

Congrats! You made it. Test that your method works by running `ruby bin/contacts` in the terminal. It should output the new hash without strawberry ice cream.

