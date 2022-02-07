class PartnersController < ApplicationController
  def new
    @partner = Partner.new
  end

  def back
    @partner = Partner.new(partner_params)
    render :new
  end

  def confirm
    @partner = Partner.new(partner_params)
    render :new if @partner.invalid?
  end

  def done
    @partner = Partner.new(partner_params)
    @partner.save
    PartnerMailer.partner_mail(@partner).deliver
  end

  private

  def partner_params
    params.require(:partner).permit(:company, :email, :first_name, :last_name,
                                    :first_name_kana, :last_name_kana, :phone_number, :message)
  end
end
