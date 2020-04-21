# DATA -> instance variable
# BEHAVIOR -> instance methods

class Room
  class CapicityReachedError < Exception; end

  attr_reader :capacity, :patients
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] # integer
    @patients = [] # array of instances!
  end

  def add_patient(patient)
    # self = room
    raise CapicityReachedError, "The room is full" if full?

    # adds patient to room
    @patients << patient

    # adds room to patient
    patient.room = self
  end

  def full?
    @patients.size >= @capacity
  end
end

