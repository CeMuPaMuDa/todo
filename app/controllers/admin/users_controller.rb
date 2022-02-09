# frozen_string_literal: true

module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_admin_user, only: %i[show edit update destroy]
    add_breadcrumb 'Admin Panel', :admin_root_path
    before_action :add_users_admin_breadcrumb, only: %i[index show edit new]


    # GET /admin/users
    def index
      authorize [:admin, User]
      @admin_users = policy_scope(
        User,
        policy_scope_class: Admin::UserPolicy::Scope
      ).includes(:role).page(params[:page]).per(7)
    end

    # GET /admin/users/1
    def show
      authorize [:admin, @admin_user]
      add_breadcrumb "#{@admin_user.name}", admin_user_path
    end

    # GET /admin/users/new
    def new
      @admin_user = User.new
      authorize [:admin, @admin_user]
      add_breadcrumb 'New User', new_admin_user_path
    end

    # GET /admin/users/1/edit
    def edit
      authorize [:admin, @admin_user]
      add_breadcrumb "User: #{@admin_user.name}", admin_user_path(@admin_user)
      add_breadcrumb 'Edit User', edit_admin_user_path
    end

    # POST /admin/users
    def create
      @admin_user = User.new(admin_user_params)
      authorize [:admin, @admin_user]
      if @admin_user.save
        redirect_to [:admin, @admin_user], notice: 'User was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/users/1
    def update
      if @admin_user.update(admin_user_params)
        redirect_to [:admin, @admin_user], notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/users/1
    def destroy
      authorize [:admin, @admin_user]
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
      # params.fetch(:admin_user, {})
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id)
    end

    def add_users_admin_breadcrumb
      add_breadcrumb 'Users', admin_users_path
    end
  end
end
