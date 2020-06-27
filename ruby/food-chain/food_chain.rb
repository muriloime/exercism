module FoodChain
  DIE = "I don't know why she swallowed the fly. Perhaps she'll die.\n"  
  WRIGGLING = 'wriggled and jiggled and tickled inside her.'
  STORY = {fly: DIE,
           spider: 'It ' + WRIGGLING,
           bird: 'How absurd to swallow a bird!',
           cat: 'Imagine that, to swallow a cat!',
           dog: 'What a hog, to swallow a dog!',
           goat: 'Just opened her throat and swallowed a goat!',
           cow: "I don't know how she swallowed a cow!",
           horse: "She's dead, of course!\n"}

  Animal = Struct.new(:name, :exclamation, :index) 
  
  def self.animals
    STORY.map.with_index{|*x| Animal.new(*x.flatten) }
  end

  def self.song
    animals.map do |animal|
      Stanza.new(animal).call
    end.join("\n")
  end

  class Stanza
    def initialize(animal)
      @animal = animal
    end

    def animal
      @animal.name
    end

    def exclamation
      @animal.exclamation
    end

    def index
      @animal.index
    end

    def chain
      [0,7].include?(index) ? nil : repitions(index)
    end
    
    def call
      [swallow, exclamation, chain].compact.join("\n")
    end

    def repitions(n)
      [n.downto(1).map{|i|catch_animal(i)}, DIE]
    end

    def described_animal(i)
      "#{STORY.keys[i-1]}#{(i==2) ? ' that ' + WRIGGLING : '.'}"
    end

    def catch_animal(i)
      "She swallowed the #{STORY.keys[i]} to catch the #{described_animal(i)}"
    end

    def swallow
      "I know an old lady who swallowed a #{animal}."
    end
  end
end

