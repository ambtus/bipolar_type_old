class DiscoverController < ApplicationController
  def show
    @answer = Answer.new(params[:id])
    if @answer.number == "9"
      redirect_to type_path(@answer.type_string)
    elsif @answer.can_modify
      if @answer.signal.left?
        @response = @answer.left_response
        @pure_response = @answer.left_left
        @hybrid_response = @answer.right_response
      else
        @response = @answer.right_response
        @pure_response = @answer.right_right
        @hybrid_response = @answer.left_response
      end
      render :modify
    else
      render :scale
    end
  end

end
