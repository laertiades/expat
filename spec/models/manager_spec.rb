require 'spec_helper'

describe Manager do
  before { @manager = Manager.new(name: "Example Manager", password: "foobar", password_confirmation: "foobar") }

  subject { @manager }

  it { should respond_to(:name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:authenticate) }

  it { should be_valid }
  
  describe "when name is not present" do
    before { @manager.name = " " }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @manager.name = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when name is already taken" do
    before do
      user_with_same_name = @manager.dup
      user_with_same_name.save
    end
    it { should_not be_valid }
  end
  describe "when password is not present" do
    before do
      @manager = Manager.new(name: "Example User", password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @manager.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  describe "with a password that's too short" do
    before { @manager.password = @manager.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @manager.save }
    let(:found_user) { Manager.find_by(name: @manager.name) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@manager.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end

end
