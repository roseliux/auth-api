class HomeController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    render json: { data: { message: "Welcome #{current_user.name}",
                           user: current_user } },
           status: 200
  end

  def guest
    render json: { message: I18n.t('common.welcome') }, status: 200
  end

  def email_send
    render json: { message: I18n.t('devise.passwords.send_instructions') },
           status: 200
  end

  def email_verification
  end
end
