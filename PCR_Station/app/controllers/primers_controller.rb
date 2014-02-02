class PrimersController < ApplicationController
  before_action :set_primer, only: [:show, :edit, :update, :destroy]

  def index
    @primers = Primer.all
  end

  def show
  end

  def new
    @primer = Primer.new
  end

  def edit
  end

  def create
    @primer = Primer.new(primer_params)

    respond_to do |format|
      if @primer.save
        format.html { redirect_to @primer, notice: 'Primer was successfully created.' }
      else
        render action: 'new'
      end
    end
  end

  def update
    respond_to do |format|
      if @primer.update(primer_params)
        format.html { redirect_to @primer, notice: 'Primer was successfully updated.' }
      else
        render action: 'edit'
      end
    end
  end

  def destroy
    @primer.destroy
    respond_to do |format|
      redirect_to primers_url
    end
  end

  private
    def set_primer
      @primer = Primer.find(params[:id])
    end

    def primer_params
      params.require(:primer).permit(:note, :primer_seq)
    end
end
