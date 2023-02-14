crequire 'csv'
require 'timeout'

questions=Array.new
answers=Array.new
puts "Note: Press enter to submit the answer"
table = CSV.parse(File.read("problem.csv"), headers: false)
for i in 0..table.size-1 do
questions[i] = table[i][0]
answers[i] = table[i][1]
end
def ask_question(question, answer, flag)
puts "\n QUESTION "
puts question
Timeout::timeout(flag) do
user_input = gets.chomp.strip
return user_input === answer
end
rescue Timeout::Error
puts "time is up!"
return false
end
flag = 10 # in seconds
score = 0 # initialize score
questions.each_with_index do |question, indx|
correct = ask_question(question, answers[indx], flag)
score += 1 if correct
end

puts "\nYour marks are #{score} out of #{questions.size}"
