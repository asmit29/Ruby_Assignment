module Questions
    class Questionclass
        $yescounter = 0
        $quest = [
                "Are you aware of the study details?",
                "Are we permitted to use your given personal details?",
                "Are you aware of duration of trial?",
                "Are you ready to take the trial?"
            ]
        $answer = []
        def self.create
            Questionclass.new
        end
        def ask_questions
            $quest.each_index do |i|
                puts "#{$quest[i]} yes/no"
                @ans = gets.chomp.upcase
                $answer.push(@ans)
                if @ans == "YES"
                    $yescounter += 1
                end
            end
        end
        def show_response
            $quest.each_index do |i|
                puts "#{$quest[i]} your answer: #{$answer[i]}"  
            end          
        end
    end
end

module Study
    class Studyclass
        def self.create
            Studyclass.new
        end
        def validate_study particpantObject
            if particpantObject.age > 18 && $yescounter >= 3
                puts "Congratulations #{ particpantObject.name } you are eligible for the clinical trial !!!"
            else
                puts "We regret to inform you that you are not eligible for this clinical trial"
            end
        end
    end
end

class Participant
    attr_accessor :name, :age, :gender
    def initialize
        print "Enter your full Name : "
        @name = gets.chomp
        print "Enter your age : "
        @age=gets.chomp.to_i
        print "Enter your gender : "
        @gender=gets.chomp
        self
    end
    def display_details
        puts "Name : #{@name}"
		puts "Age : #{@age}"
		puts "Gender : #{@gender}" 
    end
end

class Study_conduct
    def study_conduct study_name
        puts "Welcome to #{study_name} study !!"
        part = Participant.new
        Questions::Questionclass.create.ask_questions
        Study::Studyclass.create.validate_study part
        puts "Below are your captured details"
        part.display_details
        Questions::Questionclass.create.show_response
    end
end

Study_conduct.new.study_conduct("Covid")
Ruby_Assignment
