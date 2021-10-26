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
    collection = []

     Cat.all.each do |cat| 
      if cat.owner = self.name
        collection << cat
      end
      collection
    end
  
  end
  
    

end

