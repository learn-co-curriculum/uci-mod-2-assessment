def safe?(test_string, pw_length=8)
  has_one_lowercase?(test_string) &&
  has_one_uppercase?(test_string) &&
  has_one_number?(test_string) &&
  has_one_special_character?(test_string) &&
  is_long_enough?(test_string, pw_length)
end

def has_one_lowercase?(potential_password)
  !!potential_password.match(/[abcdefghijklmnopqrstuvwxyz]/)
end

def has_one_uppercase?(potential_password)
  !!potential_password.match(/[ABCDEFGHIJKLMNOPQRSTUVWXYZ]/)
end

def has_one_number?(potential_password)
  !!potential_password.match(/[0-9]/)
end

def has_one_special_character?(potential_password)
  !!potential_password.match(%r'[!#$%&()*+,-./:;<=>?@\[\]^_{|}~]')
end

def is_long_enough?(potential_password, required_length)
  potential_password.length >= required_length
end
