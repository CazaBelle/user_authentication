RSpec.feature 'User Authentication' do
  context 'Sign Up' do
    scenario 'A user can signup' do
      visit '/'
      click_on 'Sign up'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign up'
      expect(page).to have_content 'Welcome, test@test.com'
    end
  end

  context 'signup twice with the same email' do
    scenario 'A user signs-up twice' do
      visit '/'
      click_on 'Sign up'
      fill_in :email, with: 'test2@test.com'
      fill_in :password, with: 'secret123'
      click_on 'Sign up'
      visit('/signup')
      fill_in :email, with: 'test2@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign up'
      expect(page.current_path).to eq '/error'
    end
  end

  
  context 'signup with a password shorter then 6 characters' do
    scenario 'A user try to signup with a short password' do
      visit '/'
      click_on 'Sign up'
      fill_in :email, with: 'test2@test.com'
      fill_in :password, with: 'secret'
      click_on 'Sign up'
      expect(page.current_path).to eq '/signup'
    end
  end
  
  context 'Sign in/out' do
  let!(:user) { User.create(email: 'test@test.com', password: 'secret123')}
    scenario 'A user can signin' do
      visit '/'
      click_on 'Sign in'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign in'

      expect(page).to have_content 'Welcome, test@test.com'
    end
    
    scenario 'A signed in user can log out' do
      visit '/signin'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign in'
      click_button 'Log out'

      expect(page.current_path).to eq '/'
      expect(page).to have_content 'Sign up'
      expect(page).to have_content 'Sign in'
    end
  end
  
  
end
