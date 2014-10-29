class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  respond_to(:html, :json)
  
  def index
    @invoices = Invoice.all
    respond_with(@invoices)
  end

  def show
    respond_with(@invoice)
  end

  def new
    @invoice = Invoice.new
    respond_with(@invoice)
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.save
    respond_with(@invoice)
  end

  def update
    @invoice.update(invoice_params)
    respond_with(@invoice)
  end

  def destroy
    @invoice.destroy
    respond_with(@invoice)
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:date_paid, :expense_category_id, :amount, :paid_by, :comment, :month)
    end
end
