require_relative '../config/environment'



puts "HELLO WORLD"


def main
    i = TTY::Prompt.new.select("What would you like to do?") do |menu|
        menu.choices Login: "login", "Sign Up" => "signup", Exit: "exit"
    end
end

main
