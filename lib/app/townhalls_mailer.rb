require 'dotenv'
Dotenv.load('../../.env')
require 'gmail'
require 'csv'

class Mailer
  townhalls_names = []
  CSV.foreach("../../db/scrapped_data.csv") {|row| townhalls_names << row[1] }

  townhalls_emails = []
  CSV.foreach("../../db/scrapped_data.csv") {|row| townhalls_emails << row[2] }

  townhalls_names.each do |k|
    k.capitalize!
  end

  @gmail = Gmail.connect(ENV["GG_USERNAME"],ENV["GG_PSWD"])

  townhalls_names.each do |i|
    @gmail.deliver do
      to townhalls_emails[i]
      subject "Apprendre à coder gratuitement !"
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "<p>Bonjour,</p>
        <br>
        <p>Mon prénom est Nicolas, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour consiste à envoyer (avec du codage) des emails aux mairies. De cette manière, on espère leur aide pour faire de The Hacking Project une nouvelle manière de se former pour tous.</p>
        <br>
        <p>Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{townhalls_names[i]} veut changer le monde avec nous ? </p>
        <br>
        <br>
        <p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : appelez le 06.95.46.60.80 </p>
        <br>
        <p>Cordialement,</p>
        <br>
        <p>Nicolas</p>"
      end
    end
  end
end
