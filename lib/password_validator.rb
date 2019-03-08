class PasswordValidator
  class NoLowerCaseLettersError < Exception; end
  class NoUpperCaseLettersError < Exception; end
  class NoNumbersError < Exception; end
  class NoSpecialCharactersError < Exception; end
  class PasswordTooShortError < Exception; end

  def self.safe?(test_string, required_length=8)
    raise ArgumentError unless test_string
    has_one_lowercase?(test_string) &&
    has_one_uppercase?(test_string) &&
    has_one_number?(test_string) &&
    has_one_special_character?(test_string) &&
    is_long_enough?(test_string, required_length)
  end

  def self.has_one_lowercase?(s)
    raise NoLowerCaseLettersError unless s.match(/[abcdefghijklmnopqrstuvwxyz]/)
    true
  end

  def self.has_one_uppercase?(s)
    raise NoUpperCaseLettersError unless s.match(/[ABCDEFGHIJKLMNOPQRSTUVWXYZ]/)
    true
  end

  def self.has_one_number?(s)
    raise NoNumbersError unless s.match(/[0123456789]/)
    true
  end

  def self.has_one_special_character?(s)
    raise NoSpecialCharactersError unless s.match(%r'[!#$%&()*+,-./:;<=>?@\[\]^_{|}~]')
    true
  end

  def self.is_long_enough?(s, required_length)
    raise PasswordTooShortError unless s.length >= required_length
  end
end
