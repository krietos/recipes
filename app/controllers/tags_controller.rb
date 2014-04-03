class TagsController < ApplicationController
  def index
    @tag = Tag.new
    @tags = Tag.all
    render('index.html.erb')
  end

  def show
    @tag = Tag.find(params[:id])
    render('show.html.erb')
  end

  def create
    @tag = Tag.new(params[:tag])
    @tags = Tag.all
    if @tag.save
      redirect_to('/tags/')
    else
      render('index.html.erb')
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    render('edit.html.erb')
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(params[:tag])
    redirect_to("/tags/#{@tag.id}")
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to("/tags/")
  end
end
