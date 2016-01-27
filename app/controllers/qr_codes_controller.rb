class QrCodesController < ApplicationController
  before_action :authenticate_user!

  def show
    @qr = RQRCode::QRCode.new( current_user.provisioning_uri, :size => 7, :level => :h )
  end

  def disable_sms
    current_user.disable_sms
    redirect_to root_url, notice: 'SmS disabled. Now scan your QR or you will lose permission.'
  end

  def enable_sms
    current_user.enable_sms
    redirect_to root_url, notice: 'SmS enabled.'
  end

end
