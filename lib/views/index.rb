require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pp'
require "google_drive"
require 'csv'
require 'dotenv'
Dotenv.load(".env")

class Index

 attr_accessor :user_choice

  def initialize

    @user_choice = 0

    puts "====================================================================="
    puts "Salut mon lapin(e), qu'est ce que tu veux faire aujourd'hui ?"
    puts "====================================================================="


    puts "=> Appuie sur 1 si tu veux scrapper ces mails et les mettre dans un beau fichier CSV"
    puts "=> Appuie sur 2 si tu veux compiler dans une base de données les Twitters de nos chers maires"
    puts "=> Appuie sur 3 si tu veux envoyer un p'tit mail à nos chers maires"
    puts "=> Appuie sur 4 si tu veux follow les maires connectés sur Twitter"
    puts "=> Appuie sur 5 pour quitter"

    end

  def launch

    @user_choice = gets.chomp.to_i

    if  @user_choice==1
      puts "Cette opération prend du temps, allez boire un coca en attendant..."
      @csv_ajout = Adding.new
      @csv_ajout.csv_creation
      puts "Operation terminée, n'oubliez pas mon pourboire svp"


    elsif   @user_choice==2
       Scapper_twitter.new.boucle
       relaunch


    elsif  @user_choice==3
      Mailer.new.mass_emailing
      relaunch
    elsif  @user_choice==4
      Follower.new.boucle
      relaunch

    elsif  @user_choice==5
          exit
    end
  end

  def relaunch

    puts "Voulez-vous relancer le programme ? Press 1 si oui, 2 pour exit "
    @restart = gets.chomp.to_i
    while @restart < 1 || @restart >2
      puts "Veuillez entrer 1 ou 2 uniquement"
          @restart = gets.chomp.to_i
    end
     if @restart == 1
       Index.new
     elsif @restart == 2
       exit
     else
       puts "mauvais choix"
       exit
    end
  end


end


start = Index.new
start.launch #la boucle permet de relancer le programme sauf si exit
