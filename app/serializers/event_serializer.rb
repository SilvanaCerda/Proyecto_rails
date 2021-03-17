class EventSerializer < ActiveModel::Serializer
    #attributes :eventname, :description, :img, :slug, :status, :quantytickets, :price,:startdate
    attributes  :id, :eventname,:startdate, :status, :quantytickets, :price
  end
  