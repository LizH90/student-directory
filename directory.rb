def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  # get the first names
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do

    #get extra info
    puts "enter hobby"
    hobby = gets.chomp
    puts "enter height"
    height = gets.chomp
    puts "enter favourite colour"
    favourite_colour = gets.chomp

    # add the studen hash to the array
    students << {name: name, cohort: :november, hobby: hobby, country_of_birth: :UK, height: height, favourite_colour: favourite_colour}
    #let use know student count
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp

  end
  # return array of students
  students
end

def print_header
  puts "The students of Villains Academy are"
  puts "-------------"
end

def print(students)
  i=0
    while i < students.count
    puts "#{students[i][:name]} (#{students[i][:cohort]}) cohort hobby: #{students[i][:hobby]} Country of birth: #{students[i][:country_of_birth]} #{students[i][:height]} favourite colour #{students[i][:favourite_colour]} "
      i += 1
    end
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
