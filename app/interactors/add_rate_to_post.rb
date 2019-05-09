class AddRateToPost
  include Interactor

  before do
    context.params = context.rate_params[:value]
  end

  def call
    if rate_exist?
      value = context.value = Rate.find_by(post_id: context.rate_params[:post_id]).value
      result = Rate.update(value: ((context.params).to_i.+(value)/2),
                   post_id: context.rate_params[:post_id])
    else
      result = Rate.create!(value: (context.params).to_i/2,
                   post_id: context.rate_params[:post_id])
    end
    context.result = result
  end

  protected

  def rate_exist?
    Rate.find_by(post_id: context.rate_params[:post_id])
  end
end
