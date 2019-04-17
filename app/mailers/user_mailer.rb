class UserMailer < ApplicationMailer

  def image_link_to_friend(email,image)
     puts image
    #@email = email
    puts "IIIIIIIIIIIIIIIIIIIIIIIIIIIIii"
    @image = image
    puts @image
    mail(:to => email, :subject => "Look at this its awesome", :from => 'mr.jagan215@gmail.com')

  end
end
