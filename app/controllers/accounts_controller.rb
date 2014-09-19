class AccountsController < ApplicationController
  
  layout "admin"

  before_action :confirm_logged_in
  before_action :confirm_admin, :only => [:delete, :destroy]

  def index
    if params[:doctor] == "Colon Hydrotherapists" 
      @accounts = Account.where(:state => params[:state], :doctor => params[:doctor]).sorted_business
    else
      @accounts = Account.where(:state => params[:state], :doctor => params[:doctor]).sorted_name
    end      
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new(:state => params[:state], :doctor => params[:doctor])
  end

  def create
    # Instantiate a new object using form parameters
    @account = Account.new(account_params)
    # Save the object
    if @account.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "Account created successfully."
      redirect_to(:action => 'index', :state => @account.state, :doctor => @account.doctor)
    else
    # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    # Find an exisiting object using form parameters
    @account = Account.find(params[:id])
    puts params[:state]
    # Update the object
    if @account.update_attributes(account_params)
    # If update succeeds, redirect to the index action
      @account.save
      flash[:notice] = "Account updated successfully."
      redirect_to(:action => 'index', :state => @account.state, :doctor => @account.doctor)
    else
    # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @account = Account.find(params[:id])
  end

  def destroy
    account = Account.find(params[:id])
    notes = account.notes
    notes.each do |note|
      note.destroy
    end
    account.destroy
    flash[:notice] = "Account '#{account.name}' deleted successfully."
    redirect_to(:action => 'index', :state => params[:state], :doctor => params[:doctor])
  end

  def doctor
    @doctors = ["Naturopathic Doctors", "Colon Hydrotherapists", "Primal Doctors", "Affiliates"]
  end

  def state
    @states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "Washington DC", "West Virginia", "Wisconsin", "Wyoming"]
  end

  private

    def account_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:account).permit(:name, :address, :email, :phone, :fax, :business, :affiliate_number, :website, :state, :doctor, :letter, :certificate, :pads, :sent, :aff, :emailed, :call, :sold, :email2, :SMAT)
    end

    def confirm_admin
      user = AdminUser.find_by_id(session[:user_id])
      unless session[:user_id] && user.administrator
        flash[:notice] = "You do not have the correct access rights."
        redirect_to(:controller => 'access', :action => 'index')
        return false # halts the before_action
      else
        return true
      end
    end
end
