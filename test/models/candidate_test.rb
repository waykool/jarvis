require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

	def setup
    	@candidate = Candidate.new(firstName: "first_name", lastName: "last_name", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  	end


  test "should be valid" do
    assert @candidate.valid?
  end

  test "first name should be present" do
    @candidate.firstName = "     "
    assert_not @candidate.valid?
  end

  test "last name should be present" do
    @candidate.lastName = "     "
    assert_not @candidate.valid?
  end

  test "email should be present" do
    @candidate.email = "     "
    assert_not @candidate.valid?
  end

  test "first name should not be too long" do
    @candidate.firstName = "a" * 51
    assert_not @candidate.valid?
  end

  test "last name should not be too long" do
    @candidate.lastName = "a" * 51
    assert_not @candidate.valid?
  end

  test "email should not be too long" do
    @candidate.email = "a" * 244 + "@example.com"
    assert_not @candidate.valid?
  end

   test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @candidate.email = invalid_address
      assert_not @candidate.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @candidate.dup
    duplicate_user.email = @candidate.email.upcase
    @candidate.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @candidate.password = @candidate.password_confirmation = " " * 6
    assert_not @candidate.valid?
  end

  test "password should have a minimum length" do
    @candidate.password = @candidate.password_confirmation = "a" * 5
    assert_not @candidate.valid?
  end

end
