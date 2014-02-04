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
    @primer = Primer.create(primer_params)
    @primer[:primer_seq] = Bio::Sequence::NA.new(@primer.primer_seq).complement
    values1 = ["0","1","2","3","4","5","6","7","8","9","!","@","#","$","%","^","&","*","(",")"]
    values2 = ("h".."s").to_a
    values3 = ["b", "d","e","f"]
    values4 = ("u".."z").to_a
    wrong_values = (values1 + values2 + values3 + values4).to_set
    if @primer.primer_seq.split("").any? { |x| wrong_values.include?(x) }
      @primer.delete
      respond_to do |format|
        format.html { redirect_to current_user, notice: 'Primer creation failed - please enter a valid DNA sequence (A,T,C,G).' }
      end
    else
      @primer.save
      respond_to do |format|
        format.html { redirect_to current_user, notice: 'Primer was successfully created.' }
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
      format.html { redirect_to current_user, notice: 'Primer was successfully destroyed.' }
    end
  end

  private
    def set_primer
      @primer = Primer.find(params[:id])
    end

    def primer_params
      permitted = params.require(:primer).permit(:note, :primer_seq)
      permitted[:user_id] = current_user.id
      return permitted
    end
end



