


class Done_end #classe qui met fin au programme

attr_accessor :restart

  def get_back

    puts "Voulez-vous relancer le programme ? Press 1 si oui, 2 pour exit "
    @restart = gets.chomp.to_i
    while @restart < 1 || @restart >2 #boucle qui permet de ne garder que 1 ou 2
      puts "Veuillez entrer 1 ou 2 uniquement"
          @restart = gets.chomp.to_i
    end
     if @restart == 1 #relance l'index
       Index.new
     elsif @restart == 2
       exit
     else
       puts "mauvais choix"
       exit
    end
  end
end
reload = Done_end.new
reload.get_back
