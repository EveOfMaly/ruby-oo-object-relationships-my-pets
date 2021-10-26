require 'pry'

class Owner
  attr_reader :name, :species
  attr_accessor :cats, :dogs

  @@all  = []

  def self.all 
    @@all 
  end

  def initialize(owner_name)
    @name = owner_name
    @species = "human"
    @@all << self 
    @cats = []
    @dogs = []
  end

  def say_species
    "I am a human."
  end

  def self.count 
    self.all.count
  end

  def self.reset_all
    @@all.clear 
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    new_instance = Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    new_instance = Dog.new(dog_name, self)
  end
    
  def walk_dogs
    #sets the dog the owner is walking mood to happy
    Dog.all.select do |dog|
      if dog.owner == self 
        dog.mood = "happy"
      end
    end
  end

  def feed_cats 
    Cat.all.select do |cat|
      if cat.owner == self 
        cat.mood = "happy"
      end
    end
  end


  def sell_pets
    Cat.all.select do |cat|
      if cat.owner == self 
        cat.mood = "nervous"
        cat.owner = nil
    
      end
    end

    Dog.all.select do |dog|
      if dog.owner == self 
        dog.mood = "nervous"
        dog.owner = nil
      end
    end

  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

