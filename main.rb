require './result'

ATTEMPTS_ERRORS = 10

def game
  list_of_words_in_game = %w[generator iterator class function dictionary hash callable]

  number_errors = 0
  right_list = []
  bad_words_choose = []

  while 1
    puts "Welcome to the game!\nAll words from the Python language\n GLHF!\n1) press start, to start the game)\n2) Exit: press exit, to exit\n"
    choose = STDIN.gets
    # [A-Za-z] - only letters
    if !choose.match?(/[A-Za-z]/)
      puts "Only letters"
    elsif choose.downcase.include? "start"
      word_letters = list_of_words_in_game.sample.split("")
      check_words(number_errors, right_list, bad_words_choose, word_letters)

    elsif choose.downcase.include? "exit"
      puts "Exit!"
      break
    else
      puts "Choose one of the commands!"
    end
  end
end


game # start game
