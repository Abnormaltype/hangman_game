def result_(choose_user, right_list, bad_words_choose, word_letters)

  # we are check on the repeating words
  if right_list.include?(choose_user) or bad_words_choose.include?(choose_user)
    return 0
  end

  if word_letters.include?(choose_user)
    right_list << choose_user
  else
    bad_words_choose << choose_user
    return 2
  end

  if right_list.uniq.size == word_letters.size
    1
  else
    0
  end
end

def check_words(number_errors, right_choose, bad_words_choose, word_letters)
  while number_errors <= ATTEMPTS_ERRORS
    print_(number_errors, right_choose, bad_words_choose, word_letters)
    choose_letter = STDIN.gets.chomp
    if choose_letter.match?(/[A-Za-z]/)
      result_check = result_(choose_letter, right_choose, bad_words_choose, word_letters)
      if result_check == 2
        number_errors += 1
      end
    else
    puts "Only letters)"
    end
  end
end


def print_words(word_letters, right_choose)
  result = ""

  word_letters.each { |i|
    if right_choose.include?(i)
      result += "#{i} "
    else
      result += "# "
    end
  }

  result
end

def print_(number_errors, right_choose, bad_words_choose, word_letters)
  puts "Word: " + print_words(word_letters, right_choose)

  puts "Incorrect letters: #{bad_words_choose.join(",")}"

  if number_errors >= ATTEMPTS_ERRORS
    puts "You lose.\n" + "Correct word: #{word_letters.join("")}"
    abort
  elsif word_letters.uniq.size == right_choose.uniq.size # check only unique letters
    puts "You win!"
    abort
  else
    puts "Current number of attempts: #{(ATTEMPTS_ERRORS - number_errors)}"
  end
end