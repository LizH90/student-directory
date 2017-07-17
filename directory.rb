student_count = 11
# lets put all students into an array
students = [
  "Dr Hannibal Lecter",
  "Dart Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex Delarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#and then we print them
puts "The students of Villains Academy"
puts "_______"
students.each do |student|
  puts student
end 
#finally we print the total
puts "Overall, we have #{student_count} great students"
