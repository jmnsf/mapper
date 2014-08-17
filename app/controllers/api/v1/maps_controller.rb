class Api::V1::MapsController < ApplicationController
  respond_to :json

  def location

    if client_ip == '127.0.0.1'
      respond_with {} and return
    end

    gc_res = Geocoder.search(request.remote_ip)

    if gc_res && gc_res.length
      respond_with gc_res.first.data.select { |k, _| ['longitude', 'latitude'].include? k  }
    else
      respond_with {}
    end
  end
end