require './lib/user.rb'

RSpec.describe 'User' do 
let(:user) { User.create(email: "carol@gmail.com", password: 1234) }
  describe '#authenticate' do
    it 'user doesnt exist' do
     expect(User.authenticate("carol@gmail.com", 1234)).to eq nil
    end
  end
end
