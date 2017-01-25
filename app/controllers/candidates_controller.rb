class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
    @tours = Tour.all
    @tours.each do |tour|
      date = DateTime.now
      if tour.date_debut < date && date < tour.date_fin
        cookies[:tour] = tour.id
         if tour.id == 2
          @votes = Vote.two #a changer pour faire deux meilleurs candidats
          @candidates = Candidate.id #a changer pour faire deux meilleurs candidats
        else
          @candidates = Candidate.all
        end
     else
       cookies.delete :tour
     end
  end
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

end
