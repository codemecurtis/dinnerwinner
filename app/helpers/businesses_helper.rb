module BusinessesHelper
  def viewed_business
    @business = Business.find(params[:id])
  end
end
