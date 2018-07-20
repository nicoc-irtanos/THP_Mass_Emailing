class Index
  attr_accessor :user_choice

  def initialize
    reload = nil
    @user_choice = 0

    puts "=============================================================="
    puts "Salut mon lapin(e), qu'est ce que tu veux faire aujourd'hui ?"
    puts "=============================================================="

    puts "=> Appuie sur 1 si tu veux scrapper ces mails et les mettre dans un beau fichier CSV"
    puts "=> Appuie sur 2 si tu veux compiler dans une base de données les Twitters de nos chers maires"
    puts "=> Appuie sur 3 si tu veux envoyer un p'tit mail à nos chers maires"
    puts "=> Appuie sur 4 si tu veux follow les mairIes connectés sur Twitter"
    puts "=> Appuie sur 5 pour quitter"
    puts "==============================================================\n"
  end

  def launch
    @user_choice = gets.chomp.to_i
    reload = AppDone.new
    if @user_choice == 1 # appelle le scrapper.rb qui va chercher les mails des mairies et les mettre dans un csv
      puts "Cette opération prend du temps, allez boire un coca en attendant..."
      @csv_ajout = Adding.new # lance le scrapping
      @csv_ajout.csv_creation # lance la creation du CSV
      puts "Operation terminée, n'oubliez pas mon pourboire svp"
      reload.go_back
    elsif  @user_choice == 2 # lance une recherche des mairies qui disposent d'un compte twitter
      ScrapperTwitter.new.boucle
      reload.go_back # relance le fichier apres execution
    elsif  @user_choice == 3 # envoie un mail aux maires
      Mailer.new.mass_emailing
      reload.go_back # relance le fichier apres execution
    elsif  @user_choice == 4 # follow les mairies concernées par Twitter
      Follower.new.boucle
      reload.go_back # relance le fichier apres execution
    elsif  @user_choice == 5 # met fin au programme
      exit
    end
  end
end
