require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system, js: true do
  describe 'ユーザ登録のテスト' do
    context 'ユーザのデータなくログインいていない場合' do
      it 'ユーザ新規登録のテスト' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'sample'
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '000000'
        fill_in 'user[password_confirmation]', with: '000000'
        click_on 'アカウント登録'
        expect(page).to have_content 'sample'
      end
      it 'ログインしていない時はログイン画面に飛ぶテスト' do
        visit surgical_operations_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end
end