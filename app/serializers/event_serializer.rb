class EventSerializer < ActiveModel::Serializer
    attributes  :id, :eventname, :description, :img, :slug, :startdate, :publishdate, :status, :quantytickets, :price
  end
  