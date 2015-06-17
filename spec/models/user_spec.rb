require 'spec_helper'

describe User do
  	before { @user = User.new(name: "Example User", email: "user@example.com", password: "foobar",
password_confirmation: "foobar") }
	subject { @user }
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }

	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "emails format" do
		address = %w[@@.com erere.com aaa@dfdf add23@@dfd..com]
		address.each do |add|
			it "the email format #{add} is not valid" do
				# before {@user.email = add}
				@user.email = add
				expect(@user).not_to be_valid
				# it { should_not be_valid }
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end
		it { should_not be_valid }
	end

	describe "when password is not present" do
		before do
			@user = User.new(name: "Example User", email: "user@example.com",
			password: " ", password_confirmation: " ")
		end
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }
		
		describe "with valid password" do
			it { should eq found_user.authenticate(@user.password) }
		end

		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }
			it { should_not eq user_for_invalid_password }
			specify { expect(user_for_invalid_password).to be_false }
		end
	end

	describe "email address with mixed case" do
		let(:mixed_case_email) { "Foo@ExAMPle.CoM" }
		it "should be saved as all lower-case" do
			@user.email = mixed_case_email
			@user.save
			expect(@user.reload.email).to eq mixed_case_email.downcase
		end
	end

	describe "email address has not dot connect" do
		let(:connect_case_email) { "Foo@ExAMPle..CoM" }
		it "should be invalid" do
			@user.email = connect_case_email
			expect(@user.save).to be_false
			# expect(@user.save).should_not be_valid
		end
	end
end
