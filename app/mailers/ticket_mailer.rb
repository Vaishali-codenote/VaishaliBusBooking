class TicketMailer < ApplicationMailer
	default from: 'notifications@example.com'
	def ticket_create_email(ticket)
	
    @ticket = ticket
    mail(to: User.pluck(:email), subject: 'ticket successfullly created')
  end
end
