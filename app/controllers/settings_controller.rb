class SettingsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_user
  before_action :set_setting, only: [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to edit_setting_url(@setting), notice: 'Setting was successfully updated.' }
        format.json { render :edit, status: :ok, location: @setting }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_setting
      @setting = Setting.friendly.find(params[:id])
    end

    def setting_params
      params.require(:setting).permit(config: [:site_title, :site_description, :site_keywords, :site_footer, :google_analytics_tracking_id, :email, :whatsup, network: [github: [:handle, :url], facebook: [:handle, :url], twitter: [:handle, :url]]])
    end

    def authorize_user
      authorize Setting
    end
end
