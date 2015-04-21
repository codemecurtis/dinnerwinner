class DealsController < ApplicationController

  def index
    # @deals = Business.find(params[:business_id]).deals.order(created_at: :asc).reverse()
    # render :json => @deals
    @deals = Business.find(params[:business_id]).deals.order(created_at: :asc).reverse()
    newarray=[]
    @deals.each do |h|
      name = h.name
      sd = h.short_description
      pic = h.deal_image
      id = h.id
      created_at = h.created_at.strftime('%A, %d %b %Y %l:%M %p')
      newarray << {id: id, name: name, short_description: sd, deal_image: pic, created_at: created_at}
    end
    # p newarray
    # render :json => newarray
  end

  def show
     @deals = Business.find(params[:business_id]).deals.order(created_at: :asc).reverse()
    newarray=[]
    @deals.each do |h|
      name = h.name
      sd = h.short_description
      pic = h.deal_image
      id = h.id
      created_at = h.created_at.strftime('%A, %d %b %Y %l:%M %p')
      newarray << {id: id, name: name, short_description: sd, deal_image: pic, created_at: created_at}
    end
    render :json => newarray
  end

  def create
    @business = Business.find(params[:business_id])
    newdeal = Deal.create(name: params[:title], short_description: params[:content], deal_image: params[:image])
    @business.deals << newdeal
    @deals = Business.find(params[:business_id]).deals.order(created_at: :asc).reverse()
    newarray=[]
    @deals.each do |h|
      name = h.name
      sd = h.short_description
      pic = h.deal_image
      id = h.id
      created_at = h.created_at.strftime('%A, %d %b %Y %l:%M %p')
      newarray << {id: id, name: name, short_description: sd, deal_image: pic, created_at: created_at}
    end
    render :json => newarray
  end

  def update
    @deal = Deal.find(params[:id])
    @deal.update_attributes(name: params[:title], short_description: params[:edit_content], deal_image: params[:image])

    render :json => @deal
  end

  def destroy
    @deal = Deal.find(params[:id])
    id = @deal.id
    @deal.destroy
    render :json => id
  end
end
