class NotesController < ApplicationController

	layout 'admin'

	before_action :confirm_logged_in
	before_action :find_account
	def index
		@notes = @account.notes
	end

	def show
		@note = Note.find(params[:id])
	end

	def new
		user = AdminUser.find_by_id(session[:user_id])
		name = user.first_name + " " + user.last_name
		@note = Note.new({:account_id => @account.id, :date => Time.now.strftime("%B %d, %Y"), :created_by => name})
	end

	def create
		@note = Note.new(note_params)
		if @note.save
			flash[:notice] = "Note created successfully."
			redirect_to(:action => 'index', :account_id => @account.id)
		else
			render('new')
		end
	end

	def edit
		@note = Note.find(params[:id])
	end

	def update
		@note = Note.find(params[:id])
		if @note.update_attributes(note_params)
			flash[:notice] = "Note updated successfully."
			redirect_to(:action => 'show', :id => @note.id, :account_id => @account.id)
		else
			render('edit')
		end
	end

	def delete
		@note = Note.find(params[:id])
	end

	def destroy
		note = Note.find(params[:id]).destroy
		flash[:notice] = "Note destroyed successfully."
		redirect_to(:action => 'index', :account_id => @account.id)
	end

	private

	def note_params
		params.require(:note).permit(:account_id, :note, :date, :created_by)
	end

	def find_account
		if params[:account_id]
			@account = Account.find(params[:account_id])
		end
	end
end
