# Classe qui met fin au programme ou le relance
class AppDone
  attr_accessor :restart

  def initialize
    @restart = 0
  end

  def go_back
    puts "Voulez-vous relancer le programme ?\nSi oui, tapez 1, sinon tapez 2 !"
    @restart = gets.chomp.to_i
    while @restart <= 0 || @restart > 2 # boucle qui permet de ne garder que 1 ou 2
      puts "Ce choix est incorrect"
      puts "Voulez-vous relancer le programme ?\nSi oui, tapez 1, sinon tapez 2 !"
      @restart = gets.chomp.to_i
    end
    if @restart == 1 # relance le programme
      Index.new.launch
    elsif @restart == 2
      exit
    else
      puts "mauvais choix"
      exit
    end
  end
end
