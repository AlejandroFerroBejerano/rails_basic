class Admin::AdminsController < Admin::BaseController
  # GET /admin/admins
  # GET /admin/admins.json
  def index
    @admin_admins = Admin.paginate(page: params[:page], per_page: 15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_admins }
    end
  end

  # GET /admin/admins/1
  # GET /admin/admins/1.json
  def show
    @admin_admin = Admin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_admin }
    end
  end

  # GET /admin/admins/new
  # GET /admin/admins/new.json
  def new
    @admin_admin = Admin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_admin }
    end
  end

  # GET /admin/admins/1/edit
  def edit
    @admin_admin = Admin.find(params[:id])
  end

  # POST /admin/admins
  # POST /admin/admins.json
  def create
    @admin_admin = Admin.new(params[:admin])

    respond_to do |format|
      if @admin_admin.save
        format.html { redirect_to [:admin, @admin_admin], notice: 'Admin was successfully created.' }
        format.json { render json: @admin_admin, status: :created, location: @admin_admin }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/admins/1
  # PUT /admin/admins/1.json
  def update
    @admin_admin = Admin.find(params[:id])

    respond_to do |format|
      if @admin_admin.update_attributes(params[:admin])
        format.html { redirect_to [:admin, @admin_admin], notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/admins/1
  # DELETE /admin/admins/1.json
  def destroy
    @admin_admin = Admin.find(params[:id])
    @admin_admin.destroy

    respond_to do |format|
      format.html { redirect_to admin_admins_url }
      format.json { head :no_content }
    end
  end
end
