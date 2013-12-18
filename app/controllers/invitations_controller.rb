class InvitationsController < ApplicationController
	before_filter :load_sender

	def index
		@invitations = Invitations.all			
	end	

	def show
		@invitation = Invitation.find(params[:id])
	end

	def new 
		@invitation = Invitation.new
	end

	def read
		@invitation = Invitation.find(params[:id])
		@invitation.read = true
		@invitation.save
		redirect_to user_path(@user)
	end

	def create
		@invitation = @user.invitations.build(invitation_params)

		@invitation.user_id = current_user.id

		if @invitation.save
			redirect_to user_path(@user)
		else
			redirect_to user_path(@user)
		end
	end

	private
	def invitation_params
		params.require(:invitation).permit(:subject, :content, :recipient_id, :users_id)
	end

	def load_sender
		@user = User.find(params[:user_id])
	end

	def load_recipient
		@recipient = User.find(params[:user_id])
	end
end
