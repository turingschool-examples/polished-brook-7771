class ContestantsController < ApplicationController
  def index 
    @contestants = Contestant.all
    #@projects = @contestants.contestant_projects
    end
  end