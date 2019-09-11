require_relative "room" 
class Hotel 
  def initialize(name, hash) 
        @name = name
        @rooms = hash
        @rooms.each do |k, v|
            @rooms[k] = Room.new(v)
        end 
    end

    def name 
        @name.split(' ').map(&:capitalize).join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person, name)
        if self.room_exists?(name)
            if @rooms[name].add_occupant(person)
                puts 'check in successful'
            else
                puts 'sorry, room is full'
            end
        else
            puts 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        # checks = [] true

        # @rooms.each do |k, v|
        #     checks << v.full?   8 8 --> true
        # end

        # checks.any?

        @rooms.any? { |room, cap| !cap.full? }
    end
    
    def list_rooms
        @rooms.each do |room, cap|
            puts "#{room} : #{cap.available_space}"
            # @rooms.each {|room, cap| puts "#{room} : #{cap.available_space}"}
        end
    end

end
