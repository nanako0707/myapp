FactoryBot.define do
  factory :surgical_operation do
    title {'title'}
    content {'content'}
    status {(I18n.t('view.wip'))}
    medical_department {(I18n.t('view.cardiovascular'))}
    user_id { 1 }
  end

  factory :new_surgical_operation, class: SurgicalOperation do
    title {'new_title'}
    content {'new_content'}
    status {(I18n.t('view.wip'))}
    medical_department {(I18n.t('view.pediatric'))}
    user_id { 2 }
  end
end
