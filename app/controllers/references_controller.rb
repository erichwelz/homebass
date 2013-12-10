class ReferencesController < ApplicationController
  before_filter :load_user
  
  def show
  	@user = Reference.find(params[:id])
  end

  def create
  	@reference = @user.references.build(reference_params)
  	@reference.user_id = @user.id
  
  	if @reference.save
  		redirect_to @user, notice: 'Reference Posted'
  	else
  		redirect_to @user
  	end
  end

  def destroy
  	@reference = Reference.find(params[:id])
  	@reference.destroy
  end

  private
  def reference_params
  	params.require(:reference).permit(:comment, :user_id)
  end

  def load_user
  	@user = User.find(params[:user_id])
  end
end
