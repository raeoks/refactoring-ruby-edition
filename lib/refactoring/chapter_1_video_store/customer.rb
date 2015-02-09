class Refactoring::Chapter1VideoStore::Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end
    # add footer lines
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
    result
  end

  def total_frequent_renter_points
    @rentals.inject(0) { |rental, total| total + rental.frequent_renter_points }
  end

  private

  def total_charge
    @rentals.inject(0) { |rental, total| total + rental.charge }
  end
end
