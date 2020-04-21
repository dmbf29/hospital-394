require 'csv'
require_relative '../models/room'

class RoomRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    @next_id = 1
    load_csv
  end

  def add_room(room)
    # give a room an id!
    room.id = @next_id
    @next_id += 1

    @rooms << room

    # save_csv
  end

  # @room_repository.find(row[:room_id].to_i)
  def find(id)
    @rooms.find { |room| room.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
    end
    @next_id = @rooms.any? ? @rooms.last.id + 1 : 1
  end

end






