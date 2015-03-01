class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy, :add_item, :add_item_complete]

  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
    @columns = @table.columns
    @item_columns = Hash.new
    @table.item_columns.each do |ic|
      unless @item_columns[ic.item_id]
        @item_columns[ic.item_id] = Hash.new
      end
      @item_columns[ic.item_id][ic.column_id] = ic.value
    end
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: 'Table was successfully created.' }
        format.json { render action: 'show', status: :created, location: @table }
      else
        format.html { render action: 'new' }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url }
      format.json { head :no_content }
    end
  end

  def add_column
    @column = Column.new
    @column.table_id = params[:id]
  end

  def add_item
  end

  def add_item_complete
    @item = Item.new
    @item.table_id = params[:item][:table_id]
    @item.name = params[:item][:name]
    @item.save
    @table.columns.each do |column|
      value = params[:column][column.id.to_s]
      ItemColumn.create(:table_id => @table.id,
                        :item_id => @item.id,
                        :column_id => column.id,
                        :value => value)
    end
    redirect_to @table
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:name, :key_column_name)
    end
end
