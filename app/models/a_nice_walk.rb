class ANiceWalk
  def self.for(person)
    if person.pets.empty?
      raise CantWalkWithoutPets
    end

    person.update(happiness: 20)
  end
end

class CantWalkWithoutPets < StandardError; end
