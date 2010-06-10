class LoansController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /loans
  # GET /loans.xml
  def index
    @loans = Loan.find(:all, :conditions => {"lender_id" => current_user.id})
    @loan = Loan.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loans }
    end
  end

  # GET /loans/1
  # GET /loans/1.xml
  def show
    @loan = Loan.find(params[:id])

    respond_to do |format|
      format.html {render :action => "update"}
      format.xml  { render :xml => @loan }
    end
  end

  # GET /loans/1/edit
  def edit
    @loan = Loan.find(params[:id])
  end

  # POST /loans
  # POST /loans.xml
  def create
    @loan = Loan.new(params[:loan])
    @loan.start_date = Date.today
    @loan.lender = current_user

    respond_to do |format|
      if @loan.save
        format.html { redirect_to(loans_url, :notice => 'Loan was successfully created.') }
        format.xml  { render :xml => @loan, :status => :created, :location => @loan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loans/1
  # PUT /loans/1.xml
  def update
    @loan = Loan.find(params[:id])

    respond_to do |format|
      if @loan.update_attributes(params[:loan])
        format.html { redirect_to(edit_loan_path, :notice => 'Loan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "update" }
        format.xml  { render :xml => @loan.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def return
    @loan = Loan.find(params[:id])
    respond_to do |format|
      @loan.return_date = Date.today
      if @loan.save
        format.html { redirect_to(loans_path, :notice => t(:loan_return_ok)) }
        format.xml  { head :ok }
      else
        format.html { redirect_to(loans_path, :notice => t(:loan_return_ko)) }
        format.xml  { render :xml => @loan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.xml
  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy

    respond_to do |format|
      format.html { redirect_to(loans_url) }
      format.xml  { head :ok }
    end
  end
end
