class PdfResumesController < ApplicationController
  def show
    respond_to do |format|
     format.pdf do
       pdf = Prawn::Document.new
       pdf.text "Hellow World!"
       send_data pdf.render,
         filename: "export.pdf",
         type: 'application/pdf',
         disposition: 'inline'
     end
   end
  end
end