require 'rails_helper'

RSpec.describe User, type: :model do

  # before :all do
  #   @cat1 = Category.new(name: 'Electronics')
  # end

  # before :each do
  #   # run script in each validation
  # end

  describe 'Validations' do

    # it "if is valid with all fields" do
    #   @product = @cat1.products.new(name: "watch", price: 19.99, quantity: 10)
    #   expect(@product).to be_valid
    # end

    
    it "it is not valid without a password" do
      user = User.new(first_name: "Erik" ,last_name: "Mackie", email: "erik.mackie@gmail.com", password: nil)
      expect(user).to_not be_valid
    end

    it "it is not valid without a password confirmation" do
      user = User.new(first_name: "Erik" ,last_name: "Mackie", email: "erik.mackie@gmail.com", password_confirmation: "password", password: " ")
      expect(user).to_not be_valid
    end

    it "it is not valid without a first name" do
      user = User.new(first_name: nil ,last_name: "Mackie", email: "erik.mackie@gmail.com", password: "password")
      expect(user).to_not be_valid
    end

    it "it is not valid without a last name" do
      user = User.new(first_name: "Erik" ,last_name: nil, email: "erik.mackie@gmail.com", password: "password")
      expect(user).to_not be_valid
    end
    
    it "it is not valid without a unique email" do
      user1 = User.create(first_name: "Erik" ,last_name: "mackie", email: "erik.mackie@gmail.com", password: "password")
      user2 = User.new(first_name: "Erik" ,last_name: "mackie", email: "ERIK.MACKIE@GMAIL.COM", password: "password")
      expect(user2).to_not be_valid
    end


  end
end


# validates :email, uniqueness: true
# t.string :first_name
# t.string :last_name
# t.string :email
# t.string :password_digest