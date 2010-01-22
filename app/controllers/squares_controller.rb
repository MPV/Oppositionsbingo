class SquaresController < ApplicationController
  # GET /squares
  # GET /squares.xml
  def index
    
    if params[:card_id].nil?
      @squares = Square.find(:all, :order => :id)
    else
      @squares = Square.find(:all, :conditions => { :card_id => params[:card_id] } )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @squares }
    end
  end

  # GET /squares/1
  # GET /squares/1.xml
  def show
    @square = Square.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @square }
    end
  end

  def daub
    
    @square = Square.find(params[:id])
    
    if @square.used == true
      @square.used = false
    else
      @square.used = true
    end
    
    if @square.save
      redirect_to(:back)
    else
      # What errors do we need to show?
    end
    
  end

  # GET /squares/new
  # GET /squares/new.xml
  def new
    @square = Square.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @square }
    end
  end

  # GET /squares/1/edit
  def edit
    @square = Square.find(params[:id])
  end

  # POST /squares
  # POST /squares.xml
  def create
    @square = Square.new(params[:square])

    respond_to do |format|
      if @square.save
        flash[:notice] = 'Square was successfully created.'
        format.html { redirect_to(@square) }
        format.xml  { render :xml => @square, :status => :created, :location => @square }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @square.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /squares/1
  # PUT /squares/1.xml
  def update
    @square = Square.find(params[:id])

    respond_to do |format|
      if @square.update_attributes(params[:square])
        flash[:notice] = 'Square was successfully updated.'
        format.html { redirect_to(@square) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @square.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /squares/1
  # DELETE /squares/1.xml
  def destroy
    @square = Square.find(params[:id])
    @square.destroy

    respond_to do |format|
      format.html { redirect_to(squares_url) }
      format.xml  { head :ok }
    end
  end
end
