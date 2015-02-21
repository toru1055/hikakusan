class ItemColumnsController < ApplicationController
  before_action :set_item_column, only: [:show, :edit, :update, :destroy]

  # GET /item_columns
  # GET /item_columns.json
  def index
    @item_columns = ItemColumn.all
  end

  # GET /item_columns/1
  # GET /item_columns/1.json
  def show
  end

  # GET /item_columns/new
  def new
    @item_column = ItemColumn.new
  end

  # GET /item_columns/1/edit
  def edit
  end

  # POST /item_columns
  # POST /item_columns.json
  def create
    @item_column = ItemColumn.new(item_column_params)

    respond_to do |format|
      if @item_column.save
        format.html { redirect_to @item_column, notice: 'Item column was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_column }
      else
        format.html { render action: 'new' }
        format.json { render json: @item_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_columns/1
  # PATCH/PUT /item_columns/1.json
  def update
    respond_to do |format|
      if @item_column.update(item_column_params)
        format.html { redirect_to @item_column, notice: 'Item column was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_columns/1
  # DELETE /item_columns/1.json
  def destroy
    @item_column.destroy
    respond_to do |format|
      format.html { redirect_to item_columns_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_column
      @item_column = ItemColumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_column_params
      params.require(:item_column).permit(:table_id, :item_id, :column_id, :value)
    end
end
