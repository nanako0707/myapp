require 'rails_helper'

RSpec.describe '手順管理機能', type: :model do
  it 'titleが空ならバリデーションが通らない' do
    surgical_operation = SurgicalOperation.new(title: '', content: '失敗テスト', medical_department: '失敗テスト')
    expect(surgical_operation).not_to be_valid
  end
  it 'contentが空ならバリデーションが通らない' do
    surgical_operation = FactoryBot.build(:surgical_operation, title: '失敗テスト', content: '', medical_department: '失敗テスト')
    expect(surgical_operation).not_to be_valid
  end
  it 'medical_departmentが空ならバリデーションが通らない' do
    surgical_operation = FactoryBot.build(:surgical_operation, title: '失敗テスト', content: '失敗テスト', medical_department: '')
    expect(surgical_operation).not_to be_valid
  end

  it 'titleとcontentとmedical_departmentに内容が記載されていればバリデーションが通る' do
    surgical_operation = FactoryBot.build(:new_surgical_operation, title: '', content: '', medical_department: '')
    expect(surgical_operation).not_to be_valid
    expect(surgical_operation.errors[:title]).to be_present
    expect(surgical_operation.errors[:content]).to be_present
    expect(surgical_operation.errors[:medical_department]).to be_present
  end
end
