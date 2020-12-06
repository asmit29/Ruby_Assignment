
@words = ["Whitespace","Handkerchief","Pharaoh", "Seahorse", "Germany", "mosquito", "earphones", "Qatar"]
$actual_word = @words.sample

$guess_word  = ""
$misses = []
guess = ""
$count_chances = 5

$actual_word.size.times do
    $guess_word += "_"
end

def checkletter
    if $actual_word.upcase.include? @input_letter.upcase
        $actual_word.split('').each_with_index do |x,i|
            if x.upcase == @input_letter.upcase
                $guess_word[i] = @input_letter.upcase
            end
        end
        puts "Correct One!!"
        puts "You have #{$count_chances} chances left"
    else
        $misses.unshift(@input_letter.upcase)
        $count_chances -= 1
        puts "Wrong!! Try Again..."
        puts "Be Careful! You have only #{$count_chances} chances left" 
    end
end

puts "Welcome to hangman game..."
puts "Your word is #{$actual_word.size} character's long"
puts "You have 5 chances left. Enter a letter"

while $count_chances != 0 || $guess_word.delete(' ') != $actual_word.downcase
    if $guess_word.delete(' ') == $actual_word.upcase
        puts "Congrats you won!"
        break;
    end
    if $count_chances == 0
        puts "Game Over!!"
        puts "Your word was #{$actual_word}"
        break;
    end

    @input_letter = gets.chomp

    if !('A'..'Z').include? @input_letter.upcase
        puts "Please enter a valid entry."
    else
        if $misses.include? @input_letter.upcase 
            puts "You have already entered this letter. Enter a new letter."
            puts "Be Careful! You have only #{$count_chances} chances left" 
        else
        checkletter
        end
    end

    puts "Word : #{$guess_word}"
    puts "Misses : #{$misses}"
    puts "Guess : #{@input_letter.upcase}"
end
