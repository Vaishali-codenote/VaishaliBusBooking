class TicketCreateJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    
    TicketMailer.ticket_create_email(ticket).deliver_now
  end
end
