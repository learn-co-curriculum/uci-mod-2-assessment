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

  describe 'subroutines are called by safe?' do
    it 'and it calls has_one_lowercase? ' do
      testpw = "TEST"
      expect(PasswordValidator).to receive(:has_one_lowercase?).with(testpw)
      expect PasswordValidator.safe?(testpw)
    end

    it 'and it calls has_one_uppercase? ' do
      testpw = "Test"
      expect(PasswordValidator).to receive(:has_one_uppercase?).with(testpw)
      expect PasswordValidator.safe?(testpw)
    end

    it 'and it calls has_one_number? ' do
      testpw = "Te1t"
      expect(PasswordValidator).to receive(:has_one_number?).with(testpw)
      expect PasswordValidator.safe?(testpw)
    end

    it 'and it calls has_one_special_character? ' do
      testpw = "Te1t!"
      expect(PasswordValidator).to receive(:has_one_special_character?).with(testpw)
      expect PasswordValidator.safe?(testpw)
    end

    it 'and it calls is_long_enough? ' do
      testpw = "Te1t!asfasdfasdf"
      expect(PasswordValidator).to receive(:is_long_enough?).with(testpw, 8)
      expect PasswordValidator.safe?(testpw)
    end

    it 'and it calls is_long_enough? when length is overridden' do
      testpw = "Te1t!"
      expect(PasswordValidator).to receive(:is_long_enough?).with(testpw, 2)
      expect PasswordValidator.safe?(testpw, 2)
    end
  end
end
