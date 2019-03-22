require 'spec_helper'

describe "Procedural Code" do
  describe 'has_one_lowercase?' do
    it 'returns true if the argument did have a lower-case letter' do
      expect( has_one_lowercase?("TEsT") ).to eq(true)
    end
    it 'returns false if the argument does not have a lower-case letter' do
      expect( has_one_lowercase?("TEST") ).to eq(false)
    end
  end

  describe 'has_one_uppercase?' do
    it 'returns true if the argument does not have a upper-case letter' do
      expect( has_one_uppercase?("TEST") ).to eq(true)
    end
    it 'returns false if the argument did have a upper-case letter' do
      expect( has_one_uppercase?("test") ).to eq(false)
    end
  end

  describe 'has_one_number?' do
    it 'returns true if the argument does not have a number' do
      expect( has_one_number?("TEST1") ).to eq(true)
    end
    it 'returns false if the argument did have a number' do
      expect( has_one_number?("test") ).to eq(false)
    end
  end

  describe 'has_one_special_character?' do
    it 'returns true if the argument does have a special_character' do
      expect( has_one_special_character?("TEST!") ).to eq(true)
    end
    it 'returns false if the argument did have a special_character' do
      expect( has_one_special_character?("test") ).to eq(false)
    end
  end

  describe 'is_long_enough?' do
    it 'returns true if the argument is long enough for the specified length' do
      expect( is_long_enough?("TESTTEST", 8) ).to eq(true)
    end

    it 'returns false if the argument is long enough for the specified length' do
      expect( is_long_enough?("T", 8) ).to eq(false)
    end

    it 'returns true if it is longer than the specified length' do
      expect( is_long_enough?("test", 1) ).to eq(true)
    end
  end

  describe 'safe? method' do
    it 'exists and requires a password as argument but not a default length' do
      expect{ safe?("TEST") }.not_to raise_error
    end

    it 'exists and requires a password as argument but accepts an overriding length' do
      expect{ safe?("TEST", 100) }.not_to raise_error
    end

    it 'returns false when there are no special characters' do
      expect( safe?("Ba1") ).to eq(false)
    end

    it 'returns false when the password is too short' do
      expect( safe?("Ba1!") ).to eq(false)
    end

    it 'returns false when the password default overridden to short' do
      expect( safe?("Ba1!", 0) ).to eq(true)
    end

    it 'returns false when there is no number' do
      expect( safe?("Ba!asdfasdfasdf") ).to eq(false)
    end

    it 'returns false when there is no upper-case-letter' do
      expect( safe?("ba!asdfasdfasdf") ).to eq(false)
    end

    it 'returns false when there is no lower-case-letter' do
      expect( safe?("BA!ASDFASDFASDF") ).to eq(false)
    end

    it 'succeeds with a strong password' do
      expect( safe?("Ba1!asdfasdfasdf") ).to eq(true)
    end
  end
end
