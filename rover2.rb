class Rover
	attr_accessor :x, :y, :bearing
	BEARINGS = %w[N E S W]

	def initialize(x, y, bearing)
		@x = x
		@y = y
		@bearing = bearing
	end

	def nasa_commands(commands)
		commands.each_char do |command|
			case command
			when "L", "R" then change_direction(command)
			when "M" then move
			else puts "Error"
			end
		end
			self
	end

	def change_direction(turn_direction)
		current_bearing = BEARINGS.index(@bearing)
		if turn_direction == "R"
			current_bearing += 1
		else
			current_bearing -= 1
		end		
		current_bearing = current_bearing % 4

		@bearing = BEARINGS[current_bearing]	
	end

	def move
		case @bearing
		when "N" then @y += 1
		when "E" then @x += 1
		when "S" then @y -= 1
		when "W" then @x -= 1
		end
	end

end

rover1 = Rover.new(1, 2, "N")
rover2 = Rover.new(3, 3, "E")

p rover1.nasa_commands("LMLMLMLMM")
p rover2.nasa_commands("MMRMMRMRRM")
