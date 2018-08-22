require_relative '../config/environment'

#sara = User.new(name: "Sara", max_price_range: 20, email: "Sarah.C@hotmail")
def greeting
  prompt = TTY::Prompt.new.select("Welcome to Heard From a Friend.") do |y|
    y.choices Exisiting: "existing", "New Member" => "signup", Exit: "exit"
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
      else
        puts "Sorry, that email address is already in use with another account."
        signup
      end
      main(new_user)
  end

  def existing

    puts "Please enter your email address"
    email_address = gets.chomp
    if !User.find_by(email:email_address)
      puts "Sorry we could not find that email address. Please try again. If you want to create a new user type signup, or to try again type try again."
      ############## NEEDS WORK, SOME FIXING#########
      response  = gets.chomp.downcase
        if response == "signup"
          signup
        else
          existing
        end
    else
      current_user = User.find_by(email:email_address)

      main(current_user)
      # binding.pry
    end
  end

  def main(current_user)
    puts "Welcome #{current_user.name}"
    puts "Do you want to view your saved activities. Type y for Yes and n to search for a new activity."
    response = gets.chomp.downcase
    if response == "y"
      saved_activities(current_user)
    elsif response == "n"
      add(current_user)
    else
      exit
    end

  end


  def saved_activities(user)
    all = user.activities
    g = all.map {|act| puts "#{act.place}, #{act.price}, #{act.genre}"}
    binding.pry
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
    # selected_act.map {|info| TTY::Prompt.new.select("Where would you like to go?", %w(Place:"#{info.place}" Price:"#{info.price}"))}
    prompt = TTY::Prompt.new
    options = []
    selected_act.each {|act| options.push({name: "#{act.place} - #{act.price}", value: act})}
    var = prompt.select("You picked", options)
    puts `clear`
    v = SavedActivity.(user_id:user.id, activity_id:var.id)





    binding.pry



    # prompt = TTY::Prompt.new.select("Welcome to Heard From a Friend.") do |y|
    #   y.choices "Place: #{selected_act[0].place} Price: #{selected_act[0].price}" =>"#{selected_act[0].genre}", Exit: "exit"
  end

# def choice
# selected_act = Activity.select{|info|info.name == name && info.price <= number}
# selected_act.each {|sel| puts "#{sel.place}, #{sel.price}"}
# end


  # prompt = TTY::Prompt.new.select("Welcome to Heard From a Friend.") do |y|
  #   y.choices "": select_act[0].place, , "New Member" => "signup", Exit: "exit"

# find_by_response("Concert",sara)
greeting
