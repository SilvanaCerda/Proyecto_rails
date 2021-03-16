Rails.application.routes.draw do
  get '/clients/:id/events', to: 'application#byclient' #listar eventos por cliente!
  get '/events', to: 'application#last' #listar los ultimos 7 // falta
  get '/events/:id', to: 'application#find' #buscar evento por ID !
  post '/clients/:client_id/events/:event_id/publish', to:'application#updatestatus' #tenemos por query pero falta codigo
  post '/event/:event_id/buy', to: 'application#payticket'
end
