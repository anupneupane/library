class CategoriesController < ApplicationController
  before_filter :load_user
  before_filter :check_if_admin, only: [:create, :edit, :update, :destroy, :new]
  before_filter :load_new_topic
  before_filter :load_variables, :only => [:update, :destroy, :edit, :show]

  # GET /categories
  # GET /categories.json
  # def index
  #   per_page = params[:per_page] || 5
  #   @categories = Category.page(params[:page]).per_page(per_page.to_i)

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @categories }
  #   end
  # end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.includes(:topics).order("topics.title ASC").find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    def load_variables
      @category = Category.includes(:channel).find(params[:category_id] || params[:id])
      @channel = @category.channel
    end
end
