class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :guest

  def index
    render json: { data: { message: "Welcome #{current_user.name}",
                           user: current_user } },
           status: :success
  end

  def guest
    render json: { message: I18n.t('common.welcome') }, status: 200
  end
end
