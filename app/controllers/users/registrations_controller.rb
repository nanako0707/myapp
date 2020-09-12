class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: :destroy
  protected

  def after_update_path_for(resource)
    users_show_path(id: current_user.id)
  end

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end
end
