require_relative '../config/environment'

<<<<<<< HEAD
#sara = User.new(name: "Sara", max_price_range: 20, email: "Sarah.C@hotmail")
=======


>>>>>>> e99ed3bf54e7838c459579dee46abe1ad5d9fea7
def greeting
  prompt = TTY::Prompt.new.select("Welcome to Heard From a Friend.") do |y|
    y.choices "Sign in": "existing", "New Member" => "signup", Exit: "exit"
  end

  case prompt

  when "existing"
    existing

  when "signup"
    signup

  when "exit"
    puts "Enjoy your day!"
    exit
  end
end


<<<<<<< HEAD
  def signup
    puts "Please enter your full name"
    name = gets.strip.downcase
    puts "Please enter an Email Address"
    email_address = gets.strip.downcase
    new_user = nil
      if User.find_by(email:email_address) == nil
        new_user = User.create(name:name, max_price_range:price_range, email:email_address)
        main(new_user)
        #Conditonal to make it so that  the user has a choice  to login with an account if he  has one
=======
def signup
  puts "Please enter your full name"
  name = gets.strip.downcase
    if name == "exit"
      puts "Thank you for using, have a nice day."
      exit
    end
  puts "Please enter an Email Address"
  email_address = gets.strip.downcase
    if email_address == "exit"
      puts "Thank you for using, have a nice day."
      exit
    end

  new_user = nil
    if User.find_by(email: email_address) == nil
        new_user = User.create(name:name, email:email_address)
        ################## figure out if they want to try the same email again/ try signing in ##################
>>>>>>> e99ed3bf54e7838c459579dee46abe1ad5d9fea7
      else
        i = TTY::Prompt.new.select("Sorry, that email address is already in use with another account. Would you like to:") do |y|
          y.choices "Sign in with existing account?": "existing", "Make a new account?" => "signup", Exit: "exit"
        end

          case i
          when "existing"
            existing
          when "signup"
            signup
          when "exit"
            puts "Thank you for using, have a nice day."
            exit
          end
      end
      main(new_user)
  end

  def existing

    puts "Please enter your email address"
    email_address = gets.chomp
    if !User.find_by(email:email_address)
<<<<<<< HEAD
      puts "Sorry we could not find that email address. Please try again. If you want to create a new user type signup, or to try again type try again."
      ############## NEEDS WORK, SOME FIXING#########
      response  = gets.chomp.downcase
        if response == "signup"
          signup
        else
=======
      i = TTY::Prompt.new.select("Sorry, we can't seem to find the email address you entered. Would you like to:") do |y|
        y.choices "Try again?" => "existing", "Make a new account?" => "signup", Exit: "exit"
      end

        case i
        when "existing"
>>>>>>> e99ed3bf54e7838c459579dee46abe1ad5d9fea7
          existing
        when "signup"
          signup
        when "exit"
          puts "Thank you for using, have a nice day."
          exit
        end
    else
      current_user = User.find_by(email:email_address)
      main(current_user)
    end
  end

  def main(current_user)
    puts "Welcome #{current_user.name}"
    i = TTY::Prompt.new.select("Would you like to:") do |y|
      y.choices "See your saved activities?" => "saved_activities", "look for something new to do?" => "add activities", Exit: "exit"
    end

    case i
    when "saved_activities"
      saved_activities(current_user)
<<<<<<< HEAD
    elsif response == "n"
      add(current_user)
    else
=======
    when "add activities"
      add(current_user)
    when "exit"
      puts "Thank you for using, have a nice day."
>>>>>>> e99ed3bf54e7838c459579dee46abe1ad5d9fea7
      exit
    end
  end


  def saved_activities(user)
    all = user.activities
    g = all.map {|act| puts "#{act.place}, #{act.price}, #{act.genre}"}
<<<<<<< HEAD
    binding.pry
=======
    ###############             do you want delete/add/exit?    ###########################
>>>>>>> e99ed3bf54e7838c459579dee46abe1ad5d9fea7
  end

  def add(user)
    i = TTY::Prompt.new.select("#{user.name}, what kind of activity are you in the mood for?") do |y|
      y.choices Concert: "Concert", Sports: "Sports", Dancing: "Dancing", Bar: "Bar", Museum: "Museum", Park:"Park", "Public Event" => "Public Event"
    end

      find_by_response(i,user)
  end


  def find_by_response(name,user)

    puts "How much would you like to spend?"
    number = gets.chomp.to_i
    ####### tty prompt to be able to  give the user a choice to either put in a price range or not ######

    puts `clear`
    selected_act = Activity.select{|info|info.name == name && info.price <= number}
    prompt = TTY::Prompt.new
    options = []
    selected_act.each {|act| options.push({name: "#{act.place} - #{act.price}", value: act})}
    var = prompt.select("You picked", options)
    puts `clear`
<<<<<<< HEAD
    v = SavedActivity.(user_id:user.id, activity_id:var.id)





    binding.pry
=======
    v = SavedActivity.create(user_id:user.id, activity_id:var.id)
>>>>>>> e99ed3bf54e7838c459579dee46abe1ad5d9fea7


    ############### puts "activity saved. what do you wanan do ?"  #########################
  end

greeting
