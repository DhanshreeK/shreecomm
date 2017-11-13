class InventoryTransfersController < ApplicationController
	# get all courses from database
  # create new object of inventory,
  # and perform authorization
  def index
    @inventories ||= Inventory.all
    @inventory = Inventory.new
    @inventory_types = InventoryType.all
    @inventory_logs = InventoryLog.all
    @inventory_transfers = Transfer.all
  end

  # find inventory_type which we selected,
  # and perform authorization
  def select
     @inventory_type = InventoryType.shod(params[:inventory_transfer_inventory_type_id])
     @inventories = @inventory_type.inventories
     @inventory_types = InventoryType.all
     respond_to do |format|
    format.js {render layout: false if request.xhr?}
        # format.js {render :partial => 'search_all' ,:layout => false}
    end
  end

  def show
     @inventory =Inventory.find(params[:id])
  end

  # findinventory_type which we selected, get all students in that batch
  # and perform authorization
  def transfer
    @inventory_type = InventoryType.find_by_id(params[:id])
    @inventory =Inventory.find_by_id(params[:format])
  end
  

  # this method is used to transfer inventory
  # from one inventory to another inventory
  # and perform authorization
 def inventory_transfer
     puts "#{params}".inspect
    @transfer = Transfer.create!(remark: params[:remark], transfer_item: params[:transfer_item], inventory_type_id: params[:transfer][:inventory_type_id]) 
    @inventory_trans = Inventory.find(params[:inventory])
    @inventory_trans.update(:transfer_id => @transfer.id)
    @inventory = InventoryType.shod(params[:transfer][:id])
    trans(params[:inventory], params[:transfer][:id], @inventory)
    inventory_transfer2
end

  # this method is used to transfer inventory
  # from one inventory_type to another inventory_type and stored inventory data in inventory log
  def trans(inventory, transfer_id, inventory_type)
    @inventory_log = InventoryLog.create!(inventory_type_id: params[:transfer][:id] )
    @inventory_update = Inventory.find(params[:inventory])
    @inventory_update.transfer.inventory_type.inventories.each do |i|
    if  @inventory_update.part_no == i.part_no
       value = i.warehouse_stock_qty
       final = value.to_i - params[:transfer_item].to_i
       # stock = final + i.engineer_stock_qty.to_i
       i.update(warehouse_stock_qty: final)     
       tot = final + i.engineer_stock_qty.to_i
       i.update(total_stock_qty: tot)
     end
    end
    @inventory.inventories.each do |f|
      if  @inventory_update.part_no == f.part_no
        value = f.warehouse_stock_qty
        final = value.to_i + params[:transfer_item].to_i
        f.update(warehouse_stock_qty: final)     
        tot = final + f.engineer_stock_qty.to_i
        f.update(total_stock_qty: tot)
      end
    end
     @inv = Inventory.create!(branch: @inventory_update.branch, part_no: @inventory_update.part_no, description: @inventory_update.description, warehouse_stock_qty: params[:transfer_item].to_i, transfered_stock_qty: params[:transfer_item].to_i, engineer_stock_qty: @inventory_update.engineer_stock_qty,location1: @inventory_update.location1,location2:@inventory_update.location2, location3: @inventory_update.location3,map: @inventory_update.map,total_stock_value: @inventory_update.total_stock_value,status: @inventory_update.status, latest_modify_date: @inventory_update.latest_modify_date,remark: @inventory_update.remark, inventory_type_id: @inventory.id, transfer_id:  @transfer.id)
     total_stock_qty1 = @inv.warehouse_stock_qty.to_i + @inv.engineer_stock_qty.to_i
     @inv.update(total_stock_qty: total_stock_qty1 )

  end

  # redirect to transfer page
  def inventory_transfer2
    flash[:success] = "Successfully Transfered"
    redirect_to inventories_path
  end
end