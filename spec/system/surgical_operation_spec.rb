require 'rails_helper'
RSpec.describe '手術手順管理機能', type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    @surgical_operation = FactoryBot.create(:surgical_operation, user: @user)
    @new_surgical_operation = FactoryBot.create(:new_surgical_operation, user: @user)
    visit new_user_session_path
    fill_in "session_email", with: "sample@example.com"
    fill_in "session_password", with: "000000"
    click_button 'ログイン'
  end
  describe '手順一覧画面' do
    context '手順を作成した場合' do
      it '作成済みの手順が表示される' do
        visit surgical_operations_path
        expect(page).to have_content 'title'
      end
    end
  end
  describe '手順登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
      end
    end
  end
  describe '手順詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示されたページに遷移する' do
      end
     end
  end
end