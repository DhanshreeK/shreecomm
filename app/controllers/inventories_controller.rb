class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy, :edit_inventory]
  respond_to :html, :json
  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.all
    respond_to do |format|
    format.html
    format.json
    format.js 
    format.csv { send_data @inventories.to_csv(['branch','part_no','description','total_stock_qty','total_stock_value','warehouse_stock_qty','engineer_stock_qty','location1',
      'location2','location3','map','status','latest_modify_date','inventory_type_id']) }
    format.xls { send_data @inventories.to_csv(col_sep: "\t") }
    end
  end


  def load_item_data
    @inventory = Inventory.find_by_id(params[:inventory_id]).present? ? Inventory.find(params[:inventory_id]) : Inventory.unscoped.find_by_id(params[:inventory_id])
    render :json => [ @inventory.description || "" , @inventory.branch, @inventory.map || ""]
  end

  def view_all
    @inventories = Inventory.all
  end

   def view_inventories
    @inventories = Inventory.all
     respond_to do |format|
      format.html
    format.js {render layout: false if request.xhr?}
        # format.js {render :partial => 'search_all' ,:layout => false}
    end
  end

    # find Inventory from database which we have type in text box
  def search_inventory
    if params[:search].present?
    @inventories ||= Inventory.search_inventory(params[:search])
    respond_to do |format|
    format.js {render layout: false if request.xhr?}
        # format.js {render :partial => 'search_all' ,:layout => false}
    end
    end
  end


  def import
    Inventory.import(params[:file])
    redirect_to inventories_path, notice: "Inventories imported successfully."
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  def edit_inventory
    respond_to do |format|
    format.html
    format.js {render partial: 'edit_modal'}
  end
     # respond_modal_with @inventory
  end

  # def respond_modal_with(*args, &blk)
  #   options = args.extract_options!
  #   options[:responder] = ModalResponder
  #   respond_with *args, options, &blk
  # end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)
    transfered_stock_qty = params[:inventory][:total_stock_qty]
    @inventory.update(:transfered_stock_qty => transfered_stock_qty)
    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventories_path, notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:branch,:transfer_id, :transfered_stock_qty, :part_no, :description, :total_stock_qty, :warehouse_stock_qty, :engineer_stock_qty, :location1, :location2, :location3, :map, :total_stock_value, :status, :latest_modify_date, :remark, :inventory_type_id)
    end
end