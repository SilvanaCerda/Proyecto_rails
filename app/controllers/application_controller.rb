class ApplicationController < ActionController::Base
    require 'openssl'
    protect_from_forgery with: :null_session


    def byclient
        @event = Event.where(client_id:params[:id])
        render json: @event
    end

    def last
        time1 = Time.new
        pars1 = time1.strftime("%Y-%m-%d")
        time2 = Time.now + 7.days
        pars2 = time2.strftime("%Y-%m-%d")
        @events = Event.where("publishdate>=(?) and publishdate<=(?) and status='published'",pars1,pars2)
        render json: @events
    end

    def find
        @event = Event.find(params[:id])
        render json: @event
    end

    def updatestatus
        time1 = Time.new
        pars1 = time1.strftime("%Y-%m-%d")
        if @event=Event.where(client_id:params[:client_id],id:params[:event_id]).update_all(status:"published", publishdate: pars1)
            render json: @event
        else
            render json: @event.errors, status: :unprocessable_entity
        end
    end

    def payticket
        name=params[:name]
        email=params[:email]
        if @ti=Ticket.last
            keyid = @ti.id
        else
            keyid = 0
        end
        keyid=keyid.to_s
        a=OpenSSL::HMAC.hexdigest('sha256', keyid, name+email)
        if @ticket=Ticket.create(Event_id:params[:event_id],buyername:name,buyeremail:email,code:a)
            @event=Event.find(params[:event_id])
            tickets=@event.quantytickets
            t=tickets-1
            if @event=Event.find(params[:event_id]).update(quantytickets:t)
                render json: @ticket
            else
                render json: @event.errors, status: :unprocessable_entity
            end
        else
            render json: @ticket.errors, status: :unprocessable_entity
        end
    end
end
