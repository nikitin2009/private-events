class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      redirect_to @invitation.event
    else
      redirect_to root_path
    end
  end

  def update
    invitation = Invitation.find(params[:id])
    invitation.update(accepted: true)
    invitation.event.attendees << invitation.receiver
    redirect_to invitation.receiver
  end

  private

    def invitation_params
      params.require(:invitation).permit(:event_id, :sender_id, :receiver_id)
    end
end
