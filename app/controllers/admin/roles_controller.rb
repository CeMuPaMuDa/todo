# frozen_string_literal: true

module Admin
  class RolesController < Admin::ApplicationController
    before_action :set_admin_role, only: %i[show edit update destroy]

    # GET /admin/roles
    def index
      authorize [:admin, Role]
      @admin_roles = Role.all
    end

    # GET /admin/roles/1
    def show
      authorize [:admin, @admin_role]
    end

    # GET /admin/roles/new
    def new
      @admin_role = Role.new
      authorize [:admin, @admin_role]
    end

    # GET /admin/roles/1/edit
    def edit
      authorize [:admin, @admin_role]
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
      params.fetch(:admin_role, {})
    end
  end
end
