class Patient
  attr_reader :name
  attr_accessor :room, :id
  # accessor creates these:
  # def room
  #   @room
  # end

  # def room=(instance)
    # @room = instance
  # end

  def initialize(attributes ={})
    @id = attributes[:id]
    @name = attributes[:name] # string
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room]
  end

  def cure!
    @cured = true
  end

  def cured?
    @cured
  end

end

# Patient.new('julien', 'ergan', 123123, 19, ,dasd )
yun =  Patient.new(name: 'Yun')
