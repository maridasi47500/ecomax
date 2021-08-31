class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy newsuggest]

  # GET /items or /items.json
  def index2
    @items = Suggestion.all.myisland(params[:dpt])
  end
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def newsuggest
@suggestion=Suggestion.new
render template: "suggestions/new", locals: {suggestion: @suggestion, item: @item}
  end
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.served_items.new
    @item.sold_items.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_path(@item.id,dpt:params[:dpt]), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_path(@item.id,dpt:params[:dpt]), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:price,:name, :city_id,:sold_items_attributes=>{}, :served_items_attributes=>{})
    end
end
