def input_students
  puts "Please enter the names of the students".center(30)
  puts "To finish, just hit return twice".center(30)
  #create an empty array
  students = []
  # get the first names
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "enter cohort".center(30)
    cohort = gets.chomp.gsub(/\n/,"")
    if cohort == ""
      cohort = :november
    end
    # add the student hash to the array with default cohort as November
    students << {name: name, cohort: cohort}
    #let use know student count take into account singular student case
    if students[0] == students[-1]
      puts "Now we have #{students.count} student".center(30)
    else
      puts "Now we have #{students.count} students".center(30)
    end
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
  i = 0
  while i < students.count
  puts "#{students[i][:name]} (#{students[i][:cohort]})".center(30)
  i += 1
  end
end

# update to take into account number of students and give singular form
def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(30)
  else
    puts "Overall, we have #{students.count} great students".center(30)
  end
end

students = input_students
print_header
print(students)
print_footer(students)
