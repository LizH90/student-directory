def input_students
  puts "Please enter the names of the students".center(30)
  puts "To finish, just hit return twice".center(30)
  #create an empty array
  students = []
  # get the first names
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do

    #get extra info
    puts "enter hobby".center(30)
    hobby = gets.chomp
    puts "enter height".center(30)
    height = gets.chomp
    puts "enter favourite colour".center(30)
    favourite_colour = gets.chomp

    # add the studen hash to the array
    students << {name: name, cohort: :november, hobby: hobby, country_of_birth: :UK, height: height, favourite_colour: favourite_colour}
    #let use know student count
    puts "Now we have #{students.count} students".center(30)
    #get another name from the user
    name = gets.chomp

  end
  # return array of students
  students
end

def print_header
  puts "The students of Villains Academy are".center(30)
  puts "-------------".center(30)
end

def print(students)
  i=0
    while i < students.count
    puts "#{students[i][:name]} (#{students[i][:cohort]}) cohort hobby: #{students[i][:hobby]} Country of birth: #{students[i][:country_of_birth]} #{students[i][:height]} favourite colour #{students[i][:favourite_colour]}".center (30)
      i += 1
    end
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(30)
end

students = input_students
print_header
print(students)
print_footer(students)
