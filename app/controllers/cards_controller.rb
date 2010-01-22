class CardsController < ApplicationController
  # GET /cards
  # GET /cards.xml
  def index
    
    if params[:round_id].nil?
      @cards = Card.find(:all, :order => :id)
    else
      #@cards = Card.find_by_round_id(params[:round_id])
      @cards = Card.find(:all, :conditions => { :round_id => params[:round_id] } )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.xml
  def show
    @card = Card.find(params[:id])
    @card.count_bingos
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.xml
  def new
    @card = Card.new

    unless params[:round_id].nil?
      @card.round_id = params[:round_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.xml
  def create
    @card = Card.new(params[:card])
    save_ok = @card.save
    
    if save_ok
      
      # Now we need to get the claims that are in the cards rounds tags...
      
      # This is the cards rounds tags:
      the_rounds_tags = Tag.find(:all, :joins => :rounds, :conditions => ["rounds.id = ?", @card.round.id])
      
      tags = Array.new
      
      for tag in the_rounds_tags
        tags.push(tag.id)
      end
      
      # And these are the claims (that have the cards rounds tags):
      claims = Claim.find(:all, :joins => :tags, :conditions => ["tags.id IN (?)", tags], :order => 'random()')
      
      # The old code (that only got all random claims):
      #claims = Claim.find(:all, :order => 'random()')
      
      if claims.length >= 8
      
        for i in 0..8 do
          @card.squares.create :claim_id => claims[i].id, :position => i
        end
      
      else
        
        @card.destroy
        save_ok = false
        flash[:error] = 'Det fanns inte tillräckligt med påståenden inom den omgången för att skapa en bricka.'
      
      end
    
    end

    respond_to do |format|
      if save_ok
        flash[:notice] = 'Här är din bingobricka:'
        format.html { redirect_to(@card) }
        format.xml  { render :xml => @card, :status => :created, :location => @card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.xml
  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        flash[:notice] = 'Bingobrickan ändrades.'
        format.html { redirect_to(@card) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.xml
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to(cards_url) }
      format.xml  { head :ok }
    end
  end
end
