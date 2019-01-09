require './lib/user.rb'


  RSpec.describe 'User' do
    # let!(:password) { double :password }
    let!(:user) { User.create(email: "carol@gmail.com", password: "secret1234") }
    let(:user2) { User.create(email: "carol@gmail.com", password: "secret1234") }
    
   describe '#authenticate' do
     it 'user and password exist' do
      expect(User.authenticate("carol@gmail.com", "secret1234")).to eq user
     end
   
     it 'user doesnt exist' do
      expect(User.authenticate("james@gmail.com", "1234")).to eq nil
     end
   
     it 'user exists but password incorrect' do
      expect(User.authenticate(user.email, "5678")).to eq nil
     end
   end
    
  describe '#valid?' do
    it 'checks if the user email already exists' do
      expect(user.valid?).to eq true
    end
      it 'cant signup with the same email' do
        expect(user2.valid?).to eq false
      end
    end
  end
