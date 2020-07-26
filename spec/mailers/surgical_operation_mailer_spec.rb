require 'rails_helper'
RSpec.describe SurgicalOperationMailer, type: :mailer, js: true do
  before do
    @user = create(:user)
    @surgical_operation = create(:surgical_operation, user: @user)
    @users = User.all
  end

  describe 'メール送信' do
    subject(:mail) do
      SurgicalOperationMailer.surgical_operation_mail(@users, @surgical_operation).deliver_now
      ActionMailer::Base.deliveries.last
    end

    it 'メールの内容は正しいか' do
      expect(mail.from).to eq(['from@example.com'])
      expect(mail.to).to eq(@users.map{ |u| u.email }) 
      expect(mail.subject).to eq("手順作成・編集時の確認メール")
      expect(mail.body).to match(/title/)
    end
  end
end