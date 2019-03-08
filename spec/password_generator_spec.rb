require 'spec_helper'

describe "PasswordValidator" do
  it 'class exists' do
    expect { PasswordValidator }.not_to raise_error
  end

  describe "when initialized" do
    it 'must be given with testable string' do
      expect { PasswordValidator.new }.to raise_error(ArgumentError)
    end

    it 'must be OK when given a testable string' do
      expect { PasswordValidator.new("bad_password") }.not_to raise_error
    end

    it 'must be OK when a non-default length is passed as parameter 2' do
      expect { PasswordValidator.new("bad_password", 99) }.not_to raise_error
    end
  end

  describe "the safe? method tests the password on multiple strategies" do
    it 'fails with NoLowerCaseLettersError when there are no lower-case letters' do
      expect { PasswordValidator.new("BAD_PASSWORD").safe? }.to raise_error(PasswordValidator::NoLowerCaseLettersError)
    end

    it 'fails with NoLowerCaseLettersError when there are no upper-case letters' do
      expect { PasswordValidator.new("bad_password").safe? }.to raise_error(PasswordValidator::NoUpperCaseLettersError)
    end

    it 'fails with NoNumbersError when there are no numbers' do
      expect { PasswordValidator.new("Ba").safe? }.to raise_error(PasswordValidator::NoNumbersError)
    end

    it 'fails with NoSpecialCharactersError when there are no special characters' do
      expect { PasswordValidator.new("Ba1").safe? }.to raise_error(PasswordValidator::NoSpecialCharactersError)
    end

    it 'fails with PasswordTooShortError when the password is too short' do
      expect { PasswordValidator.new("Ba1!").safe? }.to raise_error(PasswordValidator::PasswordTooShortError)
    end

    it 'does not fail with PasswordTooShortError when the password default length is short' do
      expect { PasswordValidator.new("Ba1!", 0).safe? }.not_to raise_error
    end

    it 'succeeds with a strong password' do
      expect { PasswordValidator.new("Ba1!asdfasdfasdf") }.not_to raise_error
    end
  end

  describe "when initialized a valid password" do
    it 'does expose the required_length attribute' do
      v = PasswordValidator.new("Ba1!asdfasdfasdf")
      expect(v.required_length).to eq(8)
    end

    it 'does not expose the test_string instance variable' do
      v = PasswordValidator.new("Ba1!asdfasdfasdf")
      expect { v.test_string }.to raise_error(NoMethodError)
    end
  end

end
