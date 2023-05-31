class HoldersController < ApplicationController
  before_action :set_holder, only: %i[ show edit update destroy ]

  # GET /holders or /holders.json
  def index
    @holders = Holder.all
  end

  # GET /holders/1 or /holders/1.json
  def show
  end

  # GET /holders/new
  def new
    @holder = Holder.new
  end

  # GET /holders/1/edit
  def edit
  end

  # POST /holders or /holders.json
  def create
    @holder = Holder.new(holder_params)

    respond_to do |format|
      if @holder.save
        format.html { redirect_to holder_url(@holder), notice: "Holder was successfully created." }
        format.json { render :show, status: :created, location: @holder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holders/1 or /holders/1.json
  def update
    respond_to do |format|
      if @holder.update(holder_params)
        format.html { redirect_to holder_url(@holder), notice: "Holder was successfully updated." }
        format.json { render :show, status: :ok, location: @holder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holders/1 or /holders/1.json
  def destroy
    @holder.destroy

    respond_to do |format|
      format.html { redirect_to holders_url, notice: "Holder was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holder
      @holder = Holder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def holder_params
      params.require(:holder).permit(:first_name, :last_name)
    end
end
