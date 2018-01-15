class Admin::AdminController < ApplicationController
    before_action :authenticate_chel!
    before_action :check_admin

    layout "admin"

    protected

    def check_admin
      redirect_to root_path, alert: "У Вас нет прав доступа к данной странице" unless current_chel.admin?
    end
  end