class PasswordValidator
  class NoLowerCaseLettersError < Exception; end
  class NoUpperCaseLettersError < Exception; end
  class NoNumbersError < Exception; end
  class NoSpecialCharactersError < Exception; end
  class PasswordTooShortError < Exception; end

  attr_reader :required_length

  def initialize(test_string, required_length=8)
    @test_string = test_string
    @required_length = required_length
  end

  def safe?
    has_one_lowercase? &&
    has_one_uppercase? &&
    has_one_number? &&
    has_one_special_character? &&
    is_long_enough?
  end

  private

  def has_one_lowercase?
    raise NoLowerCaseLettersError unless @test_string.match(/[abcdefghijklmnopqrstuvwxyz]/)
    true
  end

  def has_one_uppercase?
    raise NoUpperCaseLettersError unless @test_string.match(/[ABCDEFGHIJKLMNOPQRSTUVWXYZ]/)
    true
  end

  def has_one_number?
    raise NoNumbersError unless @test_string.match(/[0123456789]/)
    true
  end

  def has_one_special_character?
    raise NoSpecialCharactersError unless @test_string.match(%r'[!#$%&()*+,-./:;<=>?@\[\]^_{|}~]')
    true
  end

  def is_long_enough?
    raise PasswordTooShortError unless @test_string.length >= required_length
  end

end
