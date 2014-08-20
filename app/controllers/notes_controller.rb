class NotesController < ApplicationController

	layout 'admin'

	before_action :confirm_logged_in
	before_action :find_account
	def index
		@notes = @account.notes
		if params[:date] != "Show All"
			@notes = @notes.where(:date => params[:date])
		end
	end

	def date
		notes = @account.notes.order("created_at ASC")
		@s1 = Set.new
		notes.each do |note|
			@s1.add(note.date)
		end
	end

	def show
		@note = Note.find(params[:id])
	end

	def new
		user = AdminUser.find_by_username(session[:username])
		if user.first_name != nil && user.last_name != nil
			name = user.first_name + " " + user.last_name
		else
			name = ""
		end
		@note = Note.new(:created_by => name, :date => Time.now.strftime("%B %d, %Y"), :account_id => @account.id)
	end

	def create
		@note = Note.new(note_params)
		if @note.save
			flash[:notice] = "Note created successfully."
			redirect_to(:action => 'index', :account_id => @account.id, :date => Time.now.strftime("%B %d, %Y"))
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
			redirect_to(:action => 'show', :id => @note.id, :account_id => @account.id, :date => Time.now.strftime("%B %d, %Y"))
		else
			render('edit')
		end
	end

	def delete
		@note = Note.find(params[:id])
	end

	def destroy
		note = Note.find(params[:id])
		note.destroy
		flash[:notice] = "Note destroyed successfully."
		redirect_to(:action => 'index', :account_id => @account.id, :date => note.date)
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
