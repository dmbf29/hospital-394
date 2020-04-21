# require_relative 'models/room'
# require_relative 'models/patient'
require_relative 'repositories/patient_repository'
require_relative 'repositories/room_repository'

room_repository = RoomRepository.new('data/rooms.csv')
patient_repository = PatientRepository.new('data/patients.csv', room_repository)


# vip = Room.new(capacity: 2)

# yun = Patient.new(name: 'Yun')
# chi = Patient.new(name: 'Chi')

# vip.add_patient(yun)
# vip.add_patient(chi)
# vip.add_patient(momo)

# p yun
# puts ''
# p yun.room.patients


# [yun]
# [yun.name, yun.cured?, yun.room]
# p vip.patients

# p vip
# p vip.full?



# momo = Patient.new(name: 'Momo')

# patient_repository.add_patient(momo)

# p patient_repository.all[0]





