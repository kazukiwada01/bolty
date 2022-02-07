class PartnerMailer < ApplicationMailer
  def partner_mail(partner)
    @partner = partner
    mail(to: ENV["TOMAIL"], subject: "パートナー登録依頼") do |format|
      format.text
    end
  end
end
