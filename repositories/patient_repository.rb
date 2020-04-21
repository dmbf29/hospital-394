require 'csv'
require_relative '../models/patient'

class PatientRepository

  def initialize(csv_file_path, room_repository)
    @room_repository = room_repository
    @csv_file_path = csv_file_path
    @patients = []
    @next_id = 1
    load_csv
  end

  def add_patient(patient)
    # give a patient an id!
    patient.id = @next_id
    @next_id += 1

    @patients << patient

    # save_csv
  end

  def all
    @patients
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true' # => true/false
      # row[:room] = @room_repository.find(row[:room_id].to_i)
      room = @room_repository.find(row[:room_id].to_i)

      patient = Patient.new(row)
      room.add_patient(patient)
      @patients << patient
    end
    @next_id = @patients.any? ? @patients.last.id + 1 : 1
  end

end
