# class Study
#     p "This is my class"

#     def initialize (location)
#         study_location = location        
#         p location 
#     end
# end

# study = Study.new('remote')
# p study



    
# require 'prime'

# p Prime.prime?(2)
# p Prime.prime?(4) 

require 'prime' 
def myfun upperVal 
    arr = (0..upperVal).to_a.select{|p| Prime.prime?(p)} 
    puts arr 
end 
myfun 27

