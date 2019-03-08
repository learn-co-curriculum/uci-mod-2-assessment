require 'spec_helper'

describe "PasswordValidator" do
  it 'class exists' do
    expect { PasswordValidator }.not_to raise_error
  end

  describe  'PasswordValidator.safe? method' do
    it 'exists' do
      expect(PasswordValidator).to respond_to(:safe?)
    end

    it 'throws an ArgumentError when it is not passed an argument' do
      expect{ PasswordValidator.safe? }.to raise_error(ArgumentError)
    end

    it 'throws no ArgumentError when it is passed a valid password but no minimum length option' do
      expect{ PasswordValidator.safe?("Ba!1asdfasdfasdf") }.not_to raise_error
    end

    it 'fails with NoLowerCaseLettersError when there are no lower-case letters' do
      expect { PasswordValidator.safe?("BAD_PASSWORD").safe? }.to raise_error(PasswordValidator::NoLowerCaseLettersError)
    end

    it 'fails with NoLowerCaseLettersError when there are no upper-case letters' do
      expect { PasswordValidator.safe?("bad_password") }.to raise_error(PasswordValidator::NoUpperCaseLettersError)
    end

    it 'fails with NoNumbersError when there are no numbers' do
      expect { PasswordValidator.safe?("Ba") }.to raise_error(PasswordValidator::NoNumbersError)
    end

    it 'fails with NoSpecialCharactersError when there are no special characters' do
      expect { PasswordValidator.safe?("Ba1") }.to raise_error(PasswordValidator::NoSpecialCharactersError)
    end

    it 'fails with PasswordTooShortError when the password is too short' do
      expect { PasswordValidator.safe?("Ba1!") }.to raise_error(PasswordValidator::PasswordTooShortError)
    end

    it 'does not fail with PasswordTooShortError when the password default length is short' do
      expect { PasswordValidator.safe?("Ba1!", 0) }.not_to raise_error
    end

    it 'succeeds with a strong password' do
      expect { PasswordValidator.safe?("Ba1!asdfasdfasdf") }.not_to raise_error
    end
  end
end
