require 'rails_helper'
RSpec.describe '手術手順管理機能', type: :system, js: true do
  describe '手順一覧画面' do
    before do
      @user = create(:admin_user)
      @surgical_operation = create(:surgical_operation, user: @user)
      @new_surgical_operation = create(:new_surgical_operation, user: @user)
      visit new_user_session_path
      fill_in "user[email]", with: "admin@example.com"
      fill_in "user[password]", with: "111111"
      click_button 'ログイン'
    end
    context '手順を作成した場合' do
      it '作成済みの手順が表示される' do
        visit surgical_operations_path
        expect(page).to have_content 'title'
      end
    end

    context '複数の手順を作成した場合' do
      it '手順が作成日時の降順に並んでいる' do
        visit surgical_operations_path
        surgical_operation_list = all('.card-title')
        expect(surgical_operation_list[0]).to have_content 'new_title'
        expect(surgical_operation_list[1]).to have_content 'title'
      end
    end

    context 'scopeメソッドで検索をした場合' do
      it "scopeメソッドで手術名検索ができる" do
        visit surgical_operations_path
        fill_in 'title', with: 'title'
        click_button '検索する'
        expect(page).to have_content 'title'
      end

      it "scopeメソッドで診療科目検索ができる" do
        visit surgical_operations_path
        select (I18n.t('view.cardiovascular')), from: 'medical_department'
        click_button '検索する'
        expect(page).to have_selector 'h6',text: (I18n.t('view.cardiovascular'))
      end

      it "scopeメソッドでステータス検索ができる" do
        visit surgical_operations_path
        select (I18n.t('view.wip')), from: 'status'
        click_button '検索する'
        expect(page).to have_selector 'h6',text: (I18n.t('view.wip'))
      end

      it "scopeメソッドで手術名と診療科目の両方が検索できる" do
        visit surgical_operations_path
        select (I18n.t('view.cardiovascular')), from: 'medical_department'
        fill_in 'title', with: 'title'
        click_button '検索する'
        expect(page).to have_content 'title'
        expect(page).to have_selector 'h6',text: (I18n.t('view.cardiovascular'))
      end

      it "scopeメソッドで手術名とステータスの両方が検索できる" do
        visit surgical_operations_path
        select (I18n.t('view.wip')), from: 'status'
        fill_in 'title', with: 'title'
        click_button '検索する'
        expect(page).to have_content 'title'
        expect(page).to have_selector 'h6',text: (I18n.t('view.wip'))
      end

      it "scopeメソッドで診療科目とステータスの両方が検索できる" do
        visit surgical_operations_path
        select (I18n.t('view.wip')), from: 'status'
        select (I18n.t('view.cardiovascular')), from: 'medical_department'
        click_button '検索する'
        expect(page).to have_selector 'h6',text: (I18n.t('view.wip'))
        expect(page).to have_selector 'h6',text: (I18n.t('view.cardiovascular'))
      end

      it "scopeメソッドで手術名と診療科目とステータスの絞り込み検索ができる" do
        visit surgical_operations_path
        select (I18n.t('view.wip')), from: 'status'
        select (I18n.t('view.cardiovascular')), from: 'medical_department'
        fill_in 'title', with: 'title'
        click_button '検索する'
        expect(page).to have_content 'title'
        expect(page).to have_selector 'h6',text: (I18n.t('view.wip'))
        expect(page).to have_selector 'h6',text: (I18n.t('view.cardiovascular'))
      end
    end
  end

  describe '手順登録画面' do
    before do
      @user = create(:admin_user)
      @surgical_operation = create(:surgical_operation, user: @user)
      @new_surgical_operation = create(:new_surgical_operation, user: @user)
      visit new_user_session_path
      fill_in "user[email]", with: "admin@example.com"
      fill_in "user[password]", with: "111111"
      click_button 'ログイン'
    end
    context '必要項目を入力して、createボタンを押した場合' do
      it 'プレミアム会員であれば、データが保存される' do
        visit new_surgical_operation_path
        select (I18n.t('view.cardiovascular')), from: 'surgical_operation_medical_department'
        fill_in 'surgical_operation[title]', with: 'title'
        fill_in 'surgical_operation[content]', with: 'content'
        click_button '登録する'
        expect(page).to have_content (I18n.t('view.cardiovascular'))
        expect(page).to have_content 'title'
      end
    end
  end

  describe 'プレミアム会員登録していないユーザーの手順投稿機能のテスト' do
    before do
      @user = create(:user)
      visit new_user_session_path
      fill_in "user[email]", with: "sample@example.com"
      fill_in "user[password]", with: "000000"
      click_button 'ログイン'
    end
    context 'プレミアム会員登録していない場合' do
      it '手順作成できない' do
        visit new_surgical_operation_path
        expect(page).to have_content 'マイページでプレミアム会員登録してください'
      end
    end
  end


  describe '手順詳細画面' do
    before do
      @user = create(:admin_user)
      @surgical_operation = create(:surgical_operation, user: @user)
      @new_surgical_operation = create(:new_surgical_operation, user: @user)
      visit new_user_session_path
      fill_in "user[email]", with: "admin@example.com"
      fill_in "user[password]", with: "111111"
      click_button 'ログイン'
    end
    context '任意の手順詳細画面に遷移した場合' do
       it '該当手順の内容が表示されたページに遷移する' do
        visit surgical_operation_path(@surgical_operation.id)
        expect(page).to have_content 'content'
       end
    end
  end
end