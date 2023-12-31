module Crudable
  extend ActiveSupport::Concern

  included do
    before_action :find_query, only: :index
    before_action :find_class, only: [:new, :create]
    before_action :find_config, only: [:create, :update, :destroy]
    before_action :find_object, only: [:show, :edit, :update, :destroy]
  end

  def index
    @search = @query.ransack(params[:q])
    @pagy, @objects = pagy(
      @search.result,
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 10
    )
  end

  def new
    @object = @class.new
  end

  def create
    @object = @class.new(object_params)

    if @object.save
      simple_stream("prepend", "lists", @object)
    else
      redirect_back(
        fallback_location: @config[:redirect_location],
        alert: @object.errors.full_messages
      )
    end
  end

  def show;end
  def edit;end

  def update
    if @object.update(object_params)
      simple_stream("replace", @object, @object)
    else
      redirect_back(
        fallback_location: @config[:redirect_location],
        alert: @object.errors.full_messages
      )
    end
  end

  def destroy
    @object.destroy
    redirect_back(
      fallback_location: @config[:redirect_location],
      notice: "Data has been deleted"
    )
  end
end
