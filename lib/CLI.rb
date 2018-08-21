
def greeting
  prompt = TTY::Prompt.new.yes?("Do you have a profile?")
end

# def greeting
#
#   prompt.yes?("Do you have a profile?")
# end

greeting
