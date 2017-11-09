class CustomerDetail < ApplicationRecord   
    belongs_to :employee
    has_many :engineer_detail, dependent: :destroy
    has_many :inventory
    has_many :inventory_items
    accepts_nested_attributes_for :inventory_items, :allow_destroy => true
    scope :shod, ->(id) { where(id: id).take }
    after_save :create_engineer_table

	def create_engineer_table
      @engineer = EngineerDetail.create!(:bill_no => self.bill_no, :custome_name => self.custome_name, :date => self.date, :address => self.address, :customer_no => self.customer_no, :telephone_no => self.telephone_no, :mobile_no => self.mobile_no, :mobile_modal_name => self.mobile_modal_name, :purchase_date => self.purchase_date, :serial_no => self.serial_no, :full_warranty => self.full_warranty, :labor_only => self.labor_only, :parts_only => self.parts_only, :out_of_warranty => self.out_of_warranty, :repair_received => self.repair_received, :repair_completed => self.repair_completed, :return_by_date => self.return_by_date, :defect_description => self.defect_description, :b2b_svc => self.b2b_svc, :accessory => self.accessory, :repair_description => self.repair_description, \
      	:condition_code => self.condition_code, :symtom_code => self.symtom_code, :defect_code => self.defect_code, :repair_code => self.repair_code, :testing_cost => self.testing_cost, :repair_cost => self.repair_cost, :software_testing_cost => self.software_testing_cost, :imei1 => self.imei1, :imei2 => self.imei2, :advanced_paid => self.advanced_paid, :status => self.status, :estimated_cost =>self.estimated_cost, :balance_cost => self.balance_cost, :grand_total => self.grand_total, :employee_id => self.employee_id, customer_detail_id: self.id)
    end

       # @engineer = EngineerDetail.create!(bill_no: self.bill_no, custome_name: self.custome_name, date: self.date, address: self.address,customer_no: self.customer_no, telephone_no: self.telephone_no,
       #  mobile_no: self.mobile_no, mobile_modal_name: self.mobile_modal_name, purchase_date: self.purchase_date ,serial_no: self.serial_no ,full_warranty: self.full_warranty, labor_only: self.labor_only ,parts_only: self.parts_only,
       #  out_of_warranty: self.out_of_warranty, repair_received:self.repair_received, repair_completed: self.repair_completed,
       #  good_delivered: self.good_delivered, return_by_date: self.return_by_date ,defect_description: self.defect_description,
       #  b2b_svc: self.b2b_svc, accessory: self.accessory, repair_description: self.repair_description,customer_detail_id: self.id, employee_id: self.employee.id,
       #  condition_code: self.condition_code,  symptom_code: self.symptom_code, defect_code:self.defect_code, repair_code: self.repair_code, compalint_type: self.compalint_type,
       #  status: self.status, estimated_cost: self.estimated_cost,balance_cost: self.balance_cost, advanced_paid: self.advanced_paid)
    

    def self.search(search)
     CustomerDetail.where('lower(customer_name) LIKE ?', "%#{search}%")
    end


   def self.to_csv(fields = column_names, options = {})
   CSV.generate(options) do |csv|
    csv << column_names
    all.each do |customer_detail|
      # if customer_detail.status == 'Work-Done' 
        csv << customer_detail.attributes.values_at(*column_names)
#         elsif customer_detail.status == 'Pending' 
#           csv << customer_detail.attributes.values_at(*column_names)
#           elsif customer_detail.status == 'Good Delivered'
#              csv << customer_detail.attributes.values_at(*column_names)
#   end
 end
    end
    end


end