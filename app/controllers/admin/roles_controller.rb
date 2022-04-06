# frozen_string_literal: true

module Admin
  class RolesController < Admin::ApplicationController
    before_action :set_admin_role, only: %i[show edit update destroy]
    add_breadcrumb 'Admin Panel', :admin_root_path
    before_action :add_roles_admin_breadcrumb, only: %i[index show edit new]

    # GET /admin/roles
    def index
      authorize [:admin, Role]
      @admin_roles = Role.all
    end

    # GET /admin/roles/1
    def show
      authorize [:admin, @admin_role]
      add_breadcrumb "#{@admin_role.alias_name}}", admin_role_path
    end

    # GET /admin/roles/new
    def new
      @admin_role = Role.new
      authorize [:admin, @admin_role]
      add_breadcrumb 'New Role', new_admin_role_path
    end

    # GET /admin/roles/1/edit
    def edit
      authorize [:admin, @admin_role]
      add_breadcrumb "Role: #{@admin_role.alias_name}", admin_role_path(@admin_role)
      add_breadcrumb 'Edit Role', edit_admin_role_path
    end

    # POST /admin/roles
    def create
      @admin_role = Role.new(admin_role_params)
      authorize [:admin, @admin_role]
      if @admin_role.save
        redirect_to @admin_role, notice: 'Role was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/roles/1
    def update
      authorize [:admin, @admin_role]
      if @admin_role.update(admin_role_params)
        redirect_to @admin_role, notice: 'Role was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/roles/1
    def destroy
      authorize [:admin, @admin_role]
      @admin_role.destroy
      redirect_to admin_roles_url, notice: 'Role was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_role
      @admin_role = Role.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_role_params
      # params.fetch(:admin_role, {})
      params.require(:role).permit(:name, :alias_name)
    end

    def add_roles_admin_breadcrumb
      add_breadcrumb 'Roles', admin_roles_path
    end
  end
end
