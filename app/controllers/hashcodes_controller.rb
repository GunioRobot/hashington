class HashcodesController < ApplicationController
  before_filter :ensure_login
  
  # GET /hashcodes
  # GET /hashcodes.xml
  def index
    @hashcodes = @current_user.hashcodes

    respond_to do |format|
      format.html # index.html.erb
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
    @hashcode = @current_user.hashcodes.new

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
	if params[:email].nil?
		@user = @current_user
	else
		@user = User.find_by_email(params[:email])
		
		# Create a new user with this email address...if one hasn't be found of course.
		if @user.nil? 
			@user = User.new(:email => params[:email])
			@user.save
		end
	end
	
	# Need to generate a new hash code.	
	@hashcode = @user.hashcodes.new(:hash => generate_hash, params[:inital_value], :current_value => params[:initial_value])

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

	def generate_hash
		# pick two sets of 5 letters & numbers
		a = ("a".."z").to_a
		(0..9).each { |i| a << i }
		
		hash = ""
		for i in (0..10)
			hash << a.at(rand(a.length)).to_s
			
			if i == 5
				hash << "-"
			end
		end
				
		if not Hashcode.find_by_hash(hash).nil?
			return generate_hash
		else
			return hash
		end
	end
end
