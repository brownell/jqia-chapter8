class OnlyController < ApplicationController

  def boot_closet_1
    #just render the boot.closet.1.html file
    render :template => 'only/boot.closet.1.html'
  end
  
  def boot_closet_2
    #just render the boot.closet.1.html file
    render :template => 'only/boot.closet.2.html'
  end

    def boot_closet_3
    #just render the boot.closet.1.html file
    render :template => 'only/boot.closet.3.html'
  end

  def get_details
    if params[:style] == "" then
      @boot = Boot.new
      @boot.name = '---'
      @boot.sku = '---'
    else
      @boot = Boot.find(params[:style])
    end
    respond_to do |wants|
      wants.js   { render :partial => 'only/get_details', :locals => { :boot => @boot } }
    end
  end

  def get_colors
    @colors = Boot.find(params[:style]).colors.collect do |co|
        { :value => co.color_code, :caption => co.name }
    end
    @colors.insert(0, { :value => '', :caption => 'choose color' } )
    @colors.insert(1, { :value => 'bk', :caption => 'black' } ) unless @colors.length > 2
    render :json => @colors
    end

  def get_sizes
    @sizes = Size.find(:all).collect do  |s|
      { :value => s.size_code, :caption => s.name }
    end
    @sizes.insert(0, { :value => '', :caption => 'choose size' } )
    render :json => @sizes
  end

  def get_term
    @explanation = Term.find_by_term_string(params[:term]).explanation
    @explanation = "Unknown term." unless @explanation
    render :text => @explanation
  end

  def get_html
    #just render the $.get.html file
    render :template => 'only/$.get.html'
  end

  def reflect_data
    @values = [params[:a], params[:b], params[:c]]
  end

  def listing_86
    render :template => 'only/listing.8.6.html'
  end

  def return_error
    render :text => "This is the error message", :status => 555
  end

  def serialize
    render :template => 'only/serialize.html'
  end
  
end
