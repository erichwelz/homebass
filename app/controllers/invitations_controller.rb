class InvitationsController < ApplicationController
	before_filter :load_sender, except: [:read]

	def index
		@invitations = Invitations.all			
	end	

	def show
		@invitation = Invitation.find(params[:id])
		@reply = Invitation.new
		
	end

	def new 
		@invitation = Invitation.new
	end

	def read
		@user = current_user
		@invitation = Invitation.find(params[:invitation_id])

		@invitation.toggle!(:read)
		if @invitation.save
		redirect_to user_path(@user)
		else
		redirect_to user_path(@user)
		end
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
		params.require(:invitation).permit(:content, :recipient_id, :user_id)
	end

	def load_sender
		@user = User.find(params[:user_id])
	end

	def load_recipient
		@recipient = User.find(params[:user_id])
	end
end
