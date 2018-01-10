class PdfResumesController < ApplicationController
  require "pp"
  def show
    response = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ak%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
    body = response.body["query"]["results"]["channel"]["units"]["distance"]
    pp body

    respond_to do |format|
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text body.to_s
        send_data pdf.render,
         filename: "export.pdf",
         type: 'application/pdf',
         disposition: 'inline'
      end
    end
  end
end