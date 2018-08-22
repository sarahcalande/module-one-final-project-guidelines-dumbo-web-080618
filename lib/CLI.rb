require 'pry'
# require_relative "../lib"

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



# def greeting
#   prompt = TTY::Prompt.new.select("Welcome to Heard From a Friend.") do |y|
#     y.choices Exisiting: "existing", "New Member" => "signup", Exit: "exit"
#   end
#
#   case prompt
#
#   when "existing"
#     existing
#
#   when "signup"
#     signup
#
#   when "exit"
#     puts "Enjoy your day!"
#     exit
#   end
# end


  # def signup
  #   puts "Please enter your full name"
  #   name = gets.chomp
  #   puts "Please enter a max price range you're willing to spend on an activity.(If you don't want to specify please enter 0)"
  #   price_range = gets.chomp
  #   puts "Please enter an Email Address"
  #   email_address = gets.chomp
  #   binding.pry
  #     if User.find_by(email:email_address)
  #       puts "Sorry, that email address is already in use with another account."
  #     else
  #       new_user = User.create(name:name, max_price_range:price_range, email:email)
  #       puts "Welcome #{new_user.name} to Heard From a Friend."
  #     end
  #     new_user
  # end
  #
  # def existing
  #   puts "Please enter your email address"
  #   email_address = gets.chomp
  #   if !User.find_by(email:email_address)
  #     puts "Sorry we could not find that email address. Please try again"
  #     existing
  #   else
  #     main
  #   end
  # end

  # def main
  #
  # end

# def greeting
#
#   prompt.yes?("Do you have a profile?")
# end
# signup
