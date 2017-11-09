require 'test_helper'

class CustomerDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_detail = customer_details(:one)
  end

  test "should get index" do
    get customer_details_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_detail_url
    assert_response :success
  end

  test "should create customer_detail" do
    assert_difference('CustomerDetail.count') do
      post customer_details_url, params: { customer_detail: { accessory: @customer_detail.accessory, address: @customer_detail.address, advanced_paid: @customer_detail.advanced_paid, b2b_svc: @customer_detail.b2b_svc, balance_cost: @customer_detail.balance_cost, bill_no: @customer_detail.bill_no, condition_code: @customer_detail.condition_code, custome_name: @customer_detail.custome_name, customer_no: @customer_detail.customer_no, date: @customer_detail.date, defect_code: @customer_detail.defect_code, defect_description: @customer_detail.defect_description, employee_id: @customer_detail.employee_id, estimated_cost: @customer_detail.estimated_cost, full_warranty: @customer_detail.full_warranty, grand_total: @customer_detail.grand_total, imei1: @customer_detail.imei1, imei2: @customer_detail.imei2, labor_only: @customer_detail.labor_only, mobile_modal_name: @customer_detail.mobile_modal_name, mobile_no: @customer_detail.mobile_no, out_of_warranty: @customer_detail.out_of_warranty, parts_only: @customer_detail.parts_only, purchase_date: @customer_detail.purchase_date, repair_code: @customer_detail.repair_code, repair_completed: @customer_detail.repair_completed, repair_cost: @customer_detail.repair_cost, repair_description: @customer_detail.repair_description, repair_received: @customer_detail.repair_received, return_by_date: @customer_detail.return_by_date, serial_no: @customer_detail.serial_no, software_testing_cost: @customer_detail.software_testing_cost, status: @customer_detail.status, symtom_code: @customer_detail.symtom_code, telephone_no: @customer_detail.telephone_no, testing_cost: @customer_detail.testing_cost } }
    end

    assert_redirected_to customer_detail_url(CustomerDetail.last)
  end

  test "should show customer_detail" do
    get customer_detail_url(@customer_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_detail_url(@customer_detail)
    assert_response :success
  end

  test "should update customer_detail" do
    patch customer_detail_url(@customer_detail), params: { customer_detail: { accessory: @customer_detail.accessory, address: @customer_detail.address, advanced_paid: @customer_detail.advanced_paid, b2b_svc: @customer_detail.b2b_svc, balance_cost: @customer_detail.balance_cost, bill_no: @customer_detail.bill_no, condition_code: @customer_detail.condition_code, custome_name: @customer_detail.custome_name, customer_no: @customer_detail.customer_no, date: @customer_detail.date, defect_code: @customer_detail.defect_code, defect_description: @customer_detail.defect_description, employee_id: @customer_detail.employee_id, estimated_cost: @customer_detail.estimated_cost, full_warranty: @customer_detail.full_warranty, grand_total: @customer_detail.grand_total, imei1: @customer_detail.imei1, imei2: @customer_detail.imei2, labor_only: @customer_detail.labor_only, mobile_modal_name: @customer_detail.mobile_modal_name, mobile_no: @customer_detail.mobile_no, out_of_warranty: @customer_detail.out_of_warranty, parts_only: @customer_detail.parts_only, purchase_date: @customer_detail.purchase_date, repair_code: @customer_detail.repair_code, repair_completed: @customer_detail.repair_completed, repair_cost: @customer_detail.repair_cost, repair_description: @customer_detail.repair_description, repair_received: @customer_detail.repair_received, return_by_date: @customer_detail.return_by_date, serial_no: @customer_detail.serial_no, software_testing_cost: @customer_detail.software_testing_cost, status: @customer_detail.status, symtom_code: @customer_detail.symtom_code, telephone_no: @customer_detail.telephone_no, testing_cost: @customer_detail.testing_cost } }
    assert_redirected_to customer_detail_url(@customer_detail)
  end

  test "should destroy customer_detail" do
    assert_difference('CustomerDetail.count', -1) do
      delete customer_detail_url(@customer_detail)
    end

    assert_redirected_to customer_details_url
  end
end
