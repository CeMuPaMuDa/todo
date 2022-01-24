# frozen_string_literal: true

module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_admin_user, only: %i[show edit update destroy]

    # GET /admin/users
    def index
      @admin_users = User.all
    end

    # GET /admin/users/1
    def show; end

    # GET /admin/users/new
    def new
      @admin_user = User.new
    end

    # GET /admin/users/1/edit
    def edit; end

    # POST /admin/users
    def create
      @admin_user = User.new(admin_user_params)

      if @admin_user.save
        redirect_to @admin_user, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/users/1
    def update
      if @admin_user.update(admin_user_params)
        redirect_to @admin_user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/users/1
    def destroy
      @admin_user.destroy
      redirect_to admin_users_url, notice: 'User was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_user_params
      params.fetch(:admin_user, {})
    end
  end
end
