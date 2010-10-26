class HashcodesController < ApplicationController
  before_filter :ensure_login
  
  # GET /hashcodes
  # GET /hashcodes.xml
  def index
    @hashcodes = @user.hashcodes

    respond_to do |format|
      #format.html # index.html.erb
      format.xml  { render :xml => @hashcodes }
    end
  end

  # GET /hashcodes/1
  # GET /hashcodes/1.xml
  def show
    @hashcode = Hashcode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hashcode }
    end
  end

  # GET /hashcodes/new
  # GET /hashcodes/new.xml
  def new
    @hashcode = Hashcode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hashcode }
    end
  end

  # GET /hashcodes/1/edit
  def edit
    @hashcode = Hashcode.find(params[:id])
  end

  # POST /hashcodes
  # POST /hashcodes.xml
  def create
    @hashcode = Hashcode.new(params[:hashcode])

    respond_to do |format|
      if @hashcode.save
        format.html { redirect_to(@hashcode, :notice => 'Hashcode was successfully created.') }
        format.xml  { render :xml => @hashcode, :status => :created, :location => @hashcode }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hashcode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hashcodes/1
  # PUT /hashcodes/1.xml
  def update
    @hashcode = Hashcode.find(params[:id])

    respond_to do |format|
      if @hashcode.update_attributes(params[:hashcode])
        format.html { redirect_to(@hashcode, :notice => 'Hashcode was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hashcode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hashcodes/1
  # DELETE /hashcodes/1.xml
  def destroy
    @hashcode = Hashcode.find(params[:id])
    @hashcode.destroy

    respond_to do |format|
      format.html { redirect_to(hashcodes_url) }
      format.xml  { head :ok }
    end
  end
end
