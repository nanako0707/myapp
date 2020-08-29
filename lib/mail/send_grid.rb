module Mail
  class SendGrid
    def initialize(settings)
      @settings = settings
    end

    def deliver!(mail)
      ## to, cc, bcc はpersonalizationで設定する
      personalization = ::SendGrid::Personalization.new
      personalization.add_to(::SendGrid::Email.new(email: mail.to.first))
      personalization.subject = mail.subject

      Array(mail.bcc).each do |email|
        personalization.add_bcc(::SendGrid::Email.new(email: email))
      end
      Array(mail.cc).each do |email|
        personalization.add_cc(::SendGrid::Email.new(email: email))
      end

      ## from, subject, contentを設定
      sg_mail = ::SendGrid::Mail.new
      sg_mail.from = ::SendGrid::Email.new(email: mail.from.first)
      sg_mail.subject = mail.subject
      sg_mail.add_content(::SendGrid::Content.new(type: 'text/html', value: mail.body.raw_source))

      ## 送信するためのメールオブジェクト完成
      sg_mail.add_personalization(personalization)

      # API KEY 
      sg = ::SendGrid::API.new(api_key: @settings[:api_key])
      response = sg.client.mail._('send').post(request_body: sg_mail.to_json)
      response.status_code
    end
  end
end