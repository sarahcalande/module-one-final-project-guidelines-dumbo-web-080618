#######################

#"Heard from a friend"
# "Welcome to heard from a friend"
# => "do you have a profile with us?"
# =>   n - sign up with your email/name/price cap? (other attributes)
# =>   y - would you like to see your favorited events or do you want us to suggest something?
  #new method, interface

#new method ***needs name****
# what do you want to do? Enter any of the following
    # day of the week
    # kind of event
    # price cap
    #




############ fix in seed ###############

#wrap signle days in arrays for iteration purposes



def greeting
  prompt = TTY::Prompt.new.yes?("Welcome to Heard From a Friend, do you have a profile?")


    if prompt == true
      puts "good"
      #What is your email?
    elsif prompt == false
      puts "bad"
      #Create User instance
    elsif prompt != true && prompt !=  false
      puts "ok"
    end

end

# def greeting
#
#   prompt.yes?("Do you have a profile?")
# end

greeting
