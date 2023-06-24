class FinanceService
  include HTTParty
  base_uri 'http://127.0.0.1:8000' # Replace with actual URL

  def create_account(student_id, name)
    options = {
      body: { student_id: student_id, name: name }
    }
    self.class.post("/invoices/createstudent", options)
    
  end

  def create_library_account(studentId)

    options = {
      headers: {
      'Content-Type': 'application/json'
      },
      body: { 'studentId': studentId }.to_json
    }
    self.class.post("http://127.0.0.1:5000/api/register", options)
   
  end

  def create_invoice(invoice_details)
    student_id = invoice_details[:student_id]
    course_id = invoice_details[:course_code]
    price = invoice_details[:price]
    self.class.post("/invoices/createcourse", body: { student_id: student_id, course_id: course_id, price: price, feetype: "Tuition Fee" })
  end
  def graduation(student_id)
    self.class.post("/payment-portal/outstanding", body: { student_id: student_id })
  end

  def cancel_invoice(invoice_id)
    self.class.put("/cancel-invoice", body: { invoice_id: invoice_id })
  end

  def view_invoice(invoice_id)
    self.class.get("/view-invoice", query: { invoice_id: invoice_id })
  end

  def view_all_invoices(user_id)
    self.class.get("/view-all-invoices", query: { user_id: user_id })
  end
end
