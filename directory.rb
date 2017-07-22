
@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list fo students.csv"
  puts "4. Load the list from the students.csv"
  puts "9. Exit " # 9 because we'll be adding more items
end

def interative_menu
  loop do
    #print the menu and ask the user what to do
    print_menu
    process(STDIN.gets.chomp)
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
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end



def input_students
  puts "Please enter the names of the students".center(30)
  puts "To finish, just hit return twice".center(30)
  # get the first names
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array with default cohort as November
    @students << {name: name, cohort: :november}
    #let use know student count take into account singular student case
    if @students.count == 1
      puts "Now we have #{@students.count} student".center(30)
    else
      puts "Now we have #{@students.count} students".center(30)
    end
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy are".center(30)
  puts "-------------".center(30)
end

def print_student_list
  @students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]}) cohort".center(30)
  end
end

# update to take into account number of students and give singular form
def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(30)
  else
    puts "Overall, we have #{@students.count} great students".center(30)
  end
end

def save_students
  # open file for writing
  file = File.open("students.csv","w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if filename doesn't exist
    puts "Sorry, #{filename} does not exist."
    exit # quit the program
  end
end

try_load_students
interative_menu
