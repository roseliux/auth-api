class HomeController < ApplicationController
  before_action :authenticate_user!, except: :guest

  def index
    render json: { data: { message: "Welcome #{current_user.name}",
                           user: current_user } },
           status: 200
  end

  def guest
    render json: { message: I18n.t('common.welcome') }, status: 200
  end
end
