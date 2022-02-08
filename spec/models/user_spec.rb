require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should not create a user if password and confirmation do not match' do
      @user = User.new({ first_name: 'Bob', last_name: 'Smith', email: 'bob@testmail.com', password: '12345', password_confirmation: '32145'})
      expect(@user).not_to be_valid
      
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      # expect(@user.valid?).to be false
    end

    it 'should not create a user if password is blank' do
      @user = User.new({ first_name: 'Bob', last_name: 'Smith', email: 'bob@testmail.com', password: ' ', password_confirmation: ' '})
      expect(@user).not_to be_valid
      # byebug
      expect(@user.errors.full_messages).to include("Password can't be blank")
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      # expect(@user.valid?).to be false
    end
    
    it 'should have a password that exists' do
      @user=User.new(first_name: "Val", last_name: "Lyash", email: "testemail@gmail.com", password: '12345', password_confirmation: '12345') #matching passwords
      expect(@user).to be_valid  
      # byebug
      # expect(@user.errors.full_messages).to eq([])
    end

    it 'should not have a blank first_name' do
      @user1=User.create(first_name: " ", last_name: "Lyash", email: "TEST@TEST.com", password: '12345', password_confirmation: '12345') #
      # byebug
      expect(@user1).to_not be_valid 
      expect(@user1.errors.full_messages).to include("First name can't be blank")
    end

    it 'should not have a blank last_name' do
      @user1=User.create(first_name: "Val ", last_name: " ", email: "TEST@TEST.com", password: '12345', password_confirmation: '12345') #
      # byebug
      expect(@user1).to_not be_valid 
      expect(@user1.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should not have a blank email' do
      @user1=User.create(first_name: "Val ", last_name: "Lyash", email: " ", password: '12345', password_confirmation: '12345') #
      # byebug
      expect(@user1).to_not be_valid 
      expect(@user1.errors.full_messages).to include("Email can't be blank")
    end

    it 'should have a unique NOT case sensitive email that exists in the database' do
      @user1=User.create(first_name: "Val", last_name: "Lyash", email: "TEST@TEST.com", password: '12345', password_confirmation: '12345') #
      expect(@user1).to be_valid 
      
      @user2=User.create(first_name: "Valentin", last_name: "Lee", email: "test@test.COM", password: '12345', password_confirmation: '12345') #
      # byebug
      expect(@user2).to_not be_valid
    end

    it 'email should not repeat' do
      @user3=User.create(first_name: "Val", last_name: "Lyash", email: "TEST@TEST.com", password: '12345', password_confirmation: '12345') #
      expect(@user3).to be_valid 
    
      @user4=User.new(first_name: "Valentin", last_name: "Lee", email: "test@test.COM", password: '123456', password_confirmation: '123456') #
      @user4.save
      expect(@user4).to_not be_valid
    end


    it 'should have a password with minimum length of 5 characters' do
      @user=User.new(first_name: "Val", last_name: "Lyash", email: "testemail@gmail.com", password: '13', password_confirmation: '13') #matching passwords
      expect(@user).to_not be_valid 
    end
    
    describe '.authenticate_with_credentials' do
      it 'should authenticate a user that based on their email and password' do
      @newuser=User.create(first_name: "Val", last_name: "Lyash", email: "testemail@gmail.com", password: '12345', password_confirmation: '12345')
      expect(User.authenticate_with_credentials("testemail@gmail.com ", '12345')).to eql(@newuser)
      end

      it 'should pass with uppercase in email' do
        @user1 = User.create(first_name: 'Bob', last_name: 'Ben', email: 'bobben@example.com', password: '12345', password_confirmation: '12345')
        expect(User.authenticate_with_credentials(" BOBBEN@EXAMPLE.COM ", '12345')).to eql(@user1)
      end
      it 'should pass if few spaces before and/or after in email' do
        @user = User.create(first_name: 'Bob', last_name: 'Ben', email: 'bobben@example.com', password: '12345', password_confirmation: '12345')
        expect(User.authenticate_with_credentials(" bobben@example.com ", '12345')).to eql(@user)
      end
    end
  end
end
  
