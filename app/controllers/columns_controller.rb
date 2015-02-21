class ColumnsController < ApplicationController
  before_action :set_column, only: [:show, :edit, :update, :destroy]

  # GET /columns
  # GET /columns.json
  def index
    @columns = Column.all
  end

  # GET /columns/1
  # GET /columns/1.json
  def show
  end

  # GET /columns/new
  def new
    @column = Column.new
  end

  # GET /columns/1/edit
  def edit
  end

  # POST /columns
  # POST /columns.json
  def create
    @column = Column.new(column_params)

    respond_to do |format|
      if @column.save
        format.html { redirect_to @column, notice: 'Column was successfully created.' }
        format.json { render action: 'show', status: :created, location: @column }
      else
        format.html { render action: 'new' }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /columns/1
  # PATCH/PUT /columns/1.json
  def update
    respond_to do |format|
      if @column.update(column_params)
        format.html { redirect_to @column, notice: 'Column was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /columns/1
  # DELETE /columns/1.json
  def destroy
    @column.destroy
    respond_to do |format|
      format.html { redirect_to columns_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_column
      @column = Column.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def column_params
      params.require(:column).permit(:table_id, :name, :type_id, :not_null, :unique, :unit, :default_value)
    end
end
