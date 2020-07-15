require 'rails_helper'
RSpec.describe SurgicalOperationMailer, type: :mailer, js: true do
  before do
    @user = create(:user)
  end
  let(:surgical_operation){ SurgicalOperation.create(id: 1, title: 'test', content: 'test-content', user: @user) }
  
    it 'メールは正しく送信されているか' do
      users = User.all
      SurgicalOperationMailer.surgical_operation_mail(users, surgical_operation).deliver_now
      mail = ActionMailer::Base.deliveries.last
      body = mail.body.parts.find {|p| p.content_type.match /html/}.body.raw_source
      it { expect(mail.from).to eq('from@example.com') }
      it { expect(mail.to).to eq(users.map{ |u| u.email }) }
      it { expect(mail.subject).to eq("手順作成・編集時の確認メール") }
      it { expect(body).to match(/title: test/) }
      it { expect(body).to match(/content: test-content/) }
    end 
end