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
    if choose.include? "start"
      word_letters = list_of_words_in_game.sample.split("")
      check_words(number_errors, right_list, bad_words_choose, word_letters)

    elsif choose.include? "exit"
      puts "Exit!"
      break

    else
      puts "Error"
    end
  end
end


game # start game
