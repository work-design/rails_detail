module Detail
  class My::NotesController < My::BaseController
    before_action :set_note

    def show
    end

    def edit
    end

    def update
      @note.assign_attributes note_params

      if @note.save
        render 'update'
      else
        render :edit, locals: { model: @note }, status: :unprocessable_entity
      end
    end

    def destroy
      @content.destroy
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
end
