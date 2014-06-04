class Person
	attr_accessor :name

	def initialize()
		@@name = name
	end

	def greeting()
		puts "Hi, my name is #{name}."
	end
end

class Student < Person
	def learn()
		puts "I get it!"
	end
end

class Instructor < Person
	def teach()
		puts "Everything in Ruby is an Object."
	end
end

chris = Instructor.new
chris.name = "Chris"
chris.greeting
christina = Student.new
christina.name = "Christina"
christina.greeting
chris.teach
christina.learn
christina.teach  # Called teach method on Student instance.  However, 
# since the teach method is within the Instructor class, the Student
# instance cannot access this method.