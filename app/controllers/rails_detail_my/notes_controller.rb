class RailsDetailMy::NotesController < RailsDetailMy::BaseController
  before_action :set_note

  def show
  end

  def edit

  end

  def update
    @note.assign_attributes note_params
    respond_to do |format|
      if @note.save
        format.html { redirect_to @content, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_note
    @note = Note.find_or_initialize_by(detail_type: params[:detail_type], detail_id: params[:detail_id])
  end

  def note_params
    params[:note].permit(
      :title,
      :body,
      :key,
      :type
    )
  end

end
