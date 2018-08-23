require_relative '../config/environment'


class String
 # colorization
 def colorize(color_code)
   "\e[#{color_code}m#{self}\e[0m"
 end

 def red
   colorize(31)
 end

 def green
   colorize(32)
 end

 def yellow
   colorize(33)
 end

 def blue
   colorize(34)
 end

 def pink
   colorize(35)
 end

 def light_blue
   colorize(36)
 end
end


#sara = User.new(name: "Sara", max_price_range: 20, email: "Sarah.C@hotmail")
def greeting
  prompt = TTY::Prompt.new.select("░░░░░░░▄▀▀▀▀█░░░░░░░░░░░░░░░░░░░░
░░░░░░█▀░░░░█░░░░░░░░░░░░░░░░░░░░
░░░░░█░░░░░░█▀▀▀▄▄░░░░░░▓░░░░░░░░
░░░░▄█░░░░░░░░░░░░▀▀▄▄░▓▓▓░░░░░░░
░░░▄█░░░░░░░░░░░░░░░░░▀▓▓▓▓▀▀▀█░░
▀▄▄█░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓░░█░░
▀▄█░▀▄░░░░▄▄░░░░░░▓▓▓▓▓▓▓░░▓▓▓▓▓▓
▄▀█▀▄░░░░███░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓░
░▀█▀▄░░░░▀▀░░░░░░░░░▄▄░░░▓▓▓▓▓░░░
░░▀█░░░░░░░░▄▄░░░░░███░░░░▓▓░█░░░
░░░▀█░░░░░░█░░▀▄░░░▀▀░░░░░▓░█▀░░░
░░░░▀█░░░░░░▀▄▄▀░░░░░░░░▀▄░█▀░░░░
░░░░░░▀█▄░░░░░░░░░░░░░▀▄░░██░░░░░
░░░░░░░░░▀█▄░░░░░░░░▀▄░░██▀░▀░░░░
░░░░░░░░░░░░▀▀▄▄▄▄▄▄▄█▀█░░▀▄░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░▀░░░░░░░░Welcome to Heard From a Friend.".pink) do |y|
    y.choices "Sign in": "existing", "New Member" => "signup", Exit: "exit"
  end

  case prompt

  when "existing"
    existing

  when "signup"
    signup

  when "exit"
    puts "Enjoy your day!".light_blue
    exit
  end
end

def signup
  puts "Please enter your full name".green
  name = gets.strip.downcase
    if name == "exit"
      puts "Thank you for using Heard From a Friend, have a nice day.".yellow
      exit
    end
  puts "Please enter an Email Address".red
  email_address = gets.strip.downcase
    if email_address == "exit"
      puts "Thank you for using Heard From a Friend, have a nice day.".green
      exit
    end

  new_user = nil
    if User.find_by(email: email_address) == nil
        new_user = User.create(name:name, email:email_address)
        ################## figure out if they want to try the same email again/ try signing in ##################
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
    email_address = gets.chomp.downcase
    if !User.find_by(email:email_address)
      i = TTY::Prompt.new.select("Sorry, we can't seem to find the email address you entered. Would you like to:") do |y|
        y.choices "Try again?" => "existing", "Make a new account?" => "signup", Exit: "exit"
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
    else
      user = User.find_by(email:email_address)
      main(user)
    end
  end

  def main(user)
    puts "Welcome #{user.name.capitalize}"
    i = TTY::Prompt.new.select("Would you like to:") do |y|
      y.choices "See your saved activities?" => "saved_activities", "Look for something new to do?" => "add activities", "Update your profile." => "update", Exit: "exit"
      #=================================MAYBE WE CAN CHANGE SAVED ACTIVITIES TO  "WOULD YOU LIKE TO SEE YOUR HISTORY " AS AN OPTION ==================================================
    end

    case i
    when "saved_activities"
      saved_activities(user)
    when "add activities"
      add(user)
    when "exit"
      puts "Thank you for using Heard From a Friend, have a nice day."
      exit
    when "update"
      update(user)
    end
  end

  def saved_activities(user)
    user.reload
    all = user.activities
    results = []
    #binding.pry
    if all.length == 0
      puts "Nothing in your saved activities, do you want to search for some?"
        yo= gets.chomp
        if yo.include?("yes")
        add(user)
      elsif yo.include?("no")
        ##################### NEEDS TO BE WORKED OUT #####################
        puts "Thanks for using! Have a great day."
        exit
      end
    else
    g = all.each_with_index { |act, i| results.push(puts " #{i + 1}. Place: #{act.place},  Price :#{act.price},  Genre:#{act.genre}")}
    #binding.pry
    puts "Do you want to delete anything from your activity list?"
      response = gets.chomp.downcase
      if response.include?("yes")
          delete(user)
      elsif response.include?("no")
            puts "Would you like to add any events?"
              response_two = gets.chomp
              if response_two.include?("yes")
                add(user)
              elsif response_two.include?("no")
                i = TTY::Prompt.new.select("Would you like to:") do |y|
                  y.choices "Go back to your saved activites?" => "saved_activities", "Exit?" => "exit"
                end
                case i
                when "saved_activities"
                  saved_activities(user)
                when "exit"
                  puts "Thank you so much for using Heard from a Friend. Have a nice day!"
                  exit
                end
            end
          end
        end
      end

  def delete(user)
    user.reload
    user_a= user.activities
    prompt = TTY::Prompt.new
    options = []
    user_a.each {|act| options.push({name:"Place:#{act.place}, Price:#{act.price}, Genre:#{act.genre}", value: act})}
    var = prompt.select("You choose to delete", options)
    #

    i = TTY::Prompt.new.select("Are you sure you want to delete this activity?") do |y|
      y.choices Yes: "yes", No: "no"
    end
    case i
    when "yes"
      #binding.pry
      del = SavedActivity.where(user_id:user.id, activity_id:var.id).destroy_all
      #binding.pry
      user.activities = user.activities.select {|act| act.id != var.id}
      user.activities
      saved_activities(user)
      # SavedActivity.delete
    when "no"
      puts "That's ok, we all make mistakes."
      saved_activities(user)
    end

  end


  def update(user)
    i = TTY::Prompt.new.select("Would you like to:") do |y|
    y.choices "Update your Email?" => "email", "Update your name?" => "name", "Delete profile" => "delete", "Return to the main page?" => "main page", Exit: "exit"
    end

    case i
    when "email"
      puts "What would you like to change your email to?"
        new_email = gets.chomp.downcase
        user.update(email: new_email)
      puts "Email updated!"
        update(user)
    when "name"
      puts "What would you like to change your name to?"
        new_name = gets.chomp.downcase
        user.update(name: new_name)
        puts "Name updated!"
          update(user)
    when "delete"
      puts "You sure you want to delete your profile?"
        t = TTY::Prompt.new.select("Would you like to:") do |y|
          y.choices "Yes" => "Yes", "No" => "No"
        end

        case t
        when "Yes"
          user.destroy
          greeting
        when "No"
          puts "We were afraid we almost lost you there."
          main(user)
        end

    when "main page"
      main(user)
    when "exit"
      puts "Thank you for using, have a nice day."
      exit
    end
  end



  def add(user)
    i = TTY::Prompt.new.select("#{user.name}, what kind of activity are you in the mood for?") do |y|
      y.choices Concert: "Concert", Sports: "Sports", Dancing: "Dancing ..M+~~~~~~~~+=~~=D.
              .M=~~~$+~~~~~~~~~~~~~~~O.
           :Z~~~~~~~~~~~~~~~~~~~~~~~~~~.
         O7Z~~~~~+~~~~~~~$Z+~~~~~ZZ~~~~~D.
       M:~~~~~~~Z$~~~~~~~~~~~~~~~~~~~~~~~M
     D~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~O
    ~~~~+?~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
  7Z~~~+Z~~~~~~~$D?~~~~~~~~~~~~~~~~~~~~~~~~?
 M~~~~~~~~~~M~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~M                                                  ..M~?
:~~~~~~~~:Z~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~M.                                        .. +NM7,~~~~~=
~~~~~~~~7~~~~~:M=~~~~~~~~~~~~~~~~~~~~~~~~~~M                                    D=~~~~~~~~~~~~~~~~?
D~~=Z+~~,~~~~$=~~~~~~~~~:NO~~~~~~~~~~~~~~~~~.                                  ~~~~~~~~~~~~~~~~~~++.
=~~=~~~~~~~+~~~~~~~:ZI~~~~~~~~~~~~~~~~~~~~~I.                                M~~~~~~~~~~~~~~~~~++N.
~~~~~~~~~~M~~~~~~Z~~~~~~~~~~~~~~~~~~~~~~~~~                                 M~~~~~~~~~~~~~~~==++D
Z~~~~~~~~M~~~~~I:~~~~~Z,:::::,~~~~~~~~~~~~+                               .,:~~~~~~~~~~~++?$7Z?
~~~~~~~~~~~~~M~~~~~~~M:::::::::~~~~~~~~~~7                                ~=~~~~~~~~=++++77NO.
=~$Z~~~~~~~~~~~~~~~~~:::::::::::8~~~~~~~=                             .N~~~~~~~~~~~=++ODND.
M~7?~~~~~~~=~~~~~~~:~::::::::::::M~~~~+I                           ..N~~~~~~~~~~~~+++IM
~~~~~~~~~Z~~~=,,:::MM::::8D::::::M~~~~7   .7MD,.                 =,~~~~~~~~~7:. ...
M~~~~~~~~~~~=::::::::+:::88I::::::~~~~=7~~~~~~~~M              M~~~~~~~~~Z
 I~~~~~~~~~~M:::::::::~::I88Z:::::M~~~~~~~~:ZMN:~N          ~=~~~~~~~~M.
  7~~~~~~~~~$:::::::::~:::7O88::::$~~~~~D=~~~~~~~~?M+..  .M~~~~~~~~M.
   I:~~~~~~~~:::~88:::::~:::887:::I~~~D~~~~~~~~~~~~~~~~~~:?~~~~+$..
     =$~~~~~~M:::888:::+~D:::::::Z~~M~~~~~~~~~~~~~~~~~~~~~M~+$.
              M:::888I~$~~~~~8$~~~M~~~~~~~=====~~~~~~~~~=N?
               7:::O888~~~~~~~M~7~~~~~~==++++$777M++?MD8.
                 ,:::8,~~~~~~~::~~~~~M MZ77M+7D8M++=8
                  IOI?N~~~~~~?~~~~~~Z8 .D7$$ZZ$77$77=
                .Z~~~~~~~~~M~~~~~~?M777D777777777777.
                $~~~~~~Z~I=:~~~~~N~~~M77D7777777778.
               ?~~~~:?~?Z~~~~~~~?~~~~~M77$7777Z8
               8~~~N~~$~~~~~~~I~~~~~~~~78$77O..
               M~~7~~O~~~~~~~D~~~~~~~~~$777777N.
                :~~~=~~~~~~~M~~~~~~~~~~77777777D.
                 ..~~~~~~~~M~~~~~~~~~~N7777777778.
                 .~~~~~~~~M$=~~~~~~:I777777777777M
                 M~~~~~~~7777$I8MM..77777777777777$
                 =~~~~~~87777$O,    .77777777777777.
                .O:~~+8$777O=..      $7777777777777D
                 .88$OMZ.            D77777777777777
                                     N77777777777777M
                                     $77777777777777Z.
                                    .7777777777777777.
                                    M7777777777777777I
                                   .$7777777777777777M
                                   O77777$ONMMD$$7777M
                                  O$77Z~~~~~~~~~~~~M$Z
                                   M~~~~~~~~~~~~~~~~=.
                                   ?~~~~~~~~~~~~~~~~M
                                  M~~~~~~~~~~~~~~~~~
                                 .~~~~~~~~~~~~~~~~~=
                                .,~~~+,:~~~~O~~~~=~.
                                M~~~M~~~==?.I~~=~~~.
                               =:::?~:::,.  ,,....".green, Bar: "Bar", Museum: "Museum:';t)/!||||(//L+)'(-\\/ddjWWW#######WmKK(\!(/-|J=/\\t/!-/\!_L\)
       |-!/(!-)\L\)/!\5(!.!LWW###################WK/|!\\\\/!;\/\T\/((\
       |!'//\//(-!t\Y/\L!m#####M####################WLt\\!)\/J-//)/;t\
       --/-.\.\/\.!)///m######K#######################WK!/!-( )-!,|/\
       //,\--`--!-/\(q#######DD##########################L\\\\-!!//!\\
       -.-!\'!!\-\/:W########N############################W,).'-.-/\-'
       !.\!-!-!`!-!W#######P|+~**@@@#######################W/,/'\-/,\7
       --`,-- -/.:W###*P!'          \`Z8#####################;,\\`,\,\
       `.'.'\`-.-d##5'-           -- '-:V@##########W#########_\-!-\\-
       `, -,.'/,G##K- '               - )7KM###################\-----/
       - '-  --:##@;                    -!ZZ###################W! \'!-
        '-.`- G###|.`                    ,D8K###################|/-.-/
       -' ,-//###@)                      -)ZWMW##################\` _\
       - ' .:Yd###!                     `-!(K5K##################|(/L|
         - :\G###Z-                    ` ! -;55ZZ#################)(4)
        . -!W####!\                     `  ' !-tVG################XNVZ
          tt####@-.                        `  ')(W################D)8@
          )8#####\                         .-`-/KW#################KD#
         ||Z####W!-              .::,\.. -,;\bZKK######8#K#########(#8
         KN8#####( ,:!/GG_      d4KW8ZKW#WWK#W#88#######W##########WK#
        )/8K###K#W#WP~~~T4(    dW##7'___L#M####MM8W###W############bM8
       \!48#K####8##W*###WY;   WRob+~~######*ff/\NM8###############WW#
       .\\KW###W#,~t' !*~!',  -M@)    `~`,),' '.`K#################@KW
       .'8M###### -'..j/Z''    @//-  ,,\\+\'    :|W######M###########8
       :\#8#K###D              \!`             !:Z8###8@#####8W#W###8M
       q8W5######             `!-`             -)8##################M8
       8WZ8#M####-             /  .          .\tK############@######ZJ
       #W#@K###W#|              //           \\tW@###@K##W##W###K###Wm
       ##8#M#8###P-            -=/,         /;D8W##############@###W##
       #8###M@####\-      ,   _)jJ;        -((WKK#####W####W##K######K
       ###W@K##K##);     `\..KW##WK       )X)KW#M##W###MW##@#W######8#
       #K#W####@#@@/;-     ~M####M\    ,.\\=)D8W##W###W##########8W##@
       ####MW######(`\\'     PPK((.:|/!-\-/)8XN@WMK#######W##MK#@#####
       ##8##MK#W#@#b!--\)L_. .(ZLWbW#\'- ,-N|/KM#######W###@########W#
       ##KW###K#W###/-  !``~~Yff*N5f -' -.\))KK#######MK##W###M8W#W###
       #W###K@K######J--    .._dd/;)/- !//)NK#8W##########8########M#K
       ##8W#K###W#####W!.   `YY\)\\)\7(-)4dW#8#@###K#W#######8########
       M####8##K#KW###W#/,       '-\\//)88W#M#@#K##M###@##M#8##@#W#8#M
       ZW#W#M#K##########m       -)!/LtWW#W##@#W#####KW#######W###K###
       K##W#####W#M#8#####KL   .-//dD##8W#K######8##########MK###W##M#
       tN#W##W#W#M##########bb4dKW#@##W##K####MK####8###########W#####
       )NM#8W##@###@##############@##@##8##K#W####M##K##K#@###8##M####
       (tMM###W##M8####@####@###@#########@####8W##8W################M
       tNZ##K###W####@#####8###/4N##8#W##W##M#8#MK#M8#K######W########
       M/K@8###M@###M##########|!t*Z#N####8##M8Z@ZZ#M###@#W#####K###W#
       WVd4M######@############D,\`(+KKZD#8WK#5@84VZ#WM############W##
       K5WM8#8W#W########8######,,-!/))ZK5@K4)@+(/XV/Z###@###W###M####
       +8WN@##@K##W###W#########b.-.\!||\X(5)Z/7\\\t5/K########W######
       8M8###@###@##8#########KDbt! !.-!t`(-\\!.\/.\!ZdG###W#MW###G###
       ~~~~~`~~~~~~~~~~~~~~~~'~` ''  ' `  `' '`      ``~`~`~`~~~~'~~~~".blue, Park:"Park", "Public Event" => "Public Event"
    end

      find_by_response(i,user)
  end


  def find_by_response(name,user)

    puts "How much would you like to spend?"
    number = gets.chomp.to_i

    ####### tty prompt to be able to  give the user a choice to either put in a price range or not ######

    puts `clear`
    selected_act = Activity.select{|info|info.name == name && info.price <= number}
    if selected_act.length == 0
      puts "Sorry, there was nothing in that price range. Want to try again?"
      response = gets.chomp
      if response.include?("yes")
        find_by_response(name, user)
      elsif response.include?("no")
        puts “get more money”
          add(user)
      end
  else
    prompt = TTY::Prompt.new
    options = []
      ##################### How do we make it into a table??? ####################
    selected_act.each {|act| options.push({name: "Place: #{act.place}, Price: #{act.price}, Type: #{act.genre}, Best Time to Go: #{act.best_time}", value: act})}
    var = prompt.select("Here are your options:", options)

    puts `clear`
    v = SavedActivity.create(user_id:user.id, activity_id:var.id)
    # g = Activity.find(var.id)
    user.reload

    i = TTY::Prompt.new.select("Activity saved in your profile! Do you want to:") do |y|
      y.choices "Look for more events?" => "events", "See saved activities?" => "saved_events", "Log out?" => "exit"
    end

        case i
        when "events"
          add(user)
        when "saved_events"
          saved_activities(user)
        when "exit"
          puts "Come back soon!"
          exit
        end
      end
  end

greeting
