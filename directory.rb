
@students = []

def interative_menu
  @students = []
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    process(selection)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list fo students.csv"
  puts "9. Exit " # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def input_students
  puts "Please enter the names of the students".center(30)
  puts "To finish, just hit return twice".center(30)
  #create an empty array
  @students = []
  # get the first names
  name = gets.gsub(/\n/,"")

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "enter cohort".center(30)
    cohort = gets.gsub(/\n/,"")
    if cohort == ""
      cohort = :november
    end
    # add the student hash to the array with default cohort as November
    @students << {name: name, cohort: cohort}
    #let use know student count take into account singular student case
    if @students.count == 1
      puts "Now we have #{@students.count} student".center(30)
    else
      puts "Now we have #{@students.count} students".center(30)
    end
    #get another name from the user
    name = gets.gsub(/\n/,"")

  end
  # return array of students
  @students
end

def print_header
  if @students.count <= 0
    return
  end
  puts "The students of Villains Academy are".center(30)
  puts "-------------".center(30)
end

def print_student_list
  if @students.count <= 0
    return
  end
  i = 0
  while i < @students.count
  puts "#{@students[i][:name]} (#{@students[i][:cohort]})".center(30)
  i += 1
  end
end

# update to take into account number of students and give singular form
def print_footer
  if @students.count <= 0
    return
  end
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(30)
  else
    puts "Overall, we have #{@students.count} great students".center(30)
  end
end

def save_students
  #open file for writing
  file = File.open("student.csv","w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interative_menu
