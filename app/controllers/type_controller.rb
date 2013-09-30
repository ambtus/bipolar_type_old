class TypeController < ApplicationController
  def show
    if params[:id].match(/^([LRlr]){4}$/)
      @type = Type.new(params[:id])
    else
      @type = Type.new(:LLLL)
      render :start
    end
  end

end
