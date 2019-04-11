class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(invitation_params)
    debugger
    if @invitation.save
      redirect_to @invitation.event
    else
      redirect_to root_path
    end
  end

  private

    def invitation_params
      params.require(:invitation).permit(:event_id, :sender_id, :receiver_id)
    end
end
