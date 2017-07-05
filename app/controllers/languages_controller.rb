# frozen_string_literal: true
class LanguagesController < ApplicationController
  def show
  end

  def new
    @language = Language.new
  end

  def create
    p = create_params

    p[:lang_type] = LangType.find_by_code(p[:lang_type])
    p[:user] = current_user
    @language = Language.new(p)

    if params[:unnamed]
      @language.name       = 'Unnamed'
      @language.nativename = 'Unnamed'
    end

    if @language.save
      redirect_to @language
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def create_params
    params.require(:language).permit(:code, :name, :nativename, :lang_type, :unnamed)
  end
end
