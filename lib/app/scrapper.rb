require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Scrapper
  attr_accessor :city_urls, :city_names, :city_depts, :city_emails
  attr_reader :dept1_link, :dept2_link, :dept3_link

  def initialize
    @city_urls = []
    @city_names = []
    @city_depts = []
    @city_emails = []
    @dept_links = ["http://annuaire-des-mairies.com/bouches-du-rhone.html", "http://www.annuaire-des-mairies.com/morbihan.html", "http://www.annuaire-des-mairies.com/loire-atlantique.html"]
  end

  # Code qui récupère toutes les url de villes d'un département.
  def take_all_the_urls_of_an_area
    @dept_links.each do |dlink|
      page = Nokogiri::HTML(open(dlink))
      page.css('.lientxt').each do |url|
        web = "http://annuaire-des-mairies.com"
        web << url['href'][1..-1]
        @city_urls << web
        @city_names << url.text # Code qui récupère tous les noms de villes d'un département.
      end
    end
  end

  # Code qui récupère le nom du département à partir de l'url d'une mairie
  def take_all_areanames_from_webpages
    @city_urls.each do |city_url|
      take_the_email_of_a_townhal_from_its_webpage(city_url) # Boucle qui récupère toutes les adresses email des mairies des départements
      page = Nokogiri::HTML(open(city_url))
      page.css('body > div > main > section.text-center.well.well-sm > div > div > div > p.lead > a').each do |dept|
        @city_depts << dept.text
      end
    end
  end

  # Code qui récupère l'adresse email à partir de l'url d'une mairie
  def take_the_email_of_a_townhal_from_its_webpage(url_array)
    doc = Nokogiri::HTML(open(url_array))
    doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
      @city_emails << email.text
    end
  end

  # Méthode retournant l'array contenant les noms de villes
  def take_names
    @city_names
  end

  # Méthode retournant l'array contenant les départements
  def take_depts
    @city_depts
  end

  # Méthode retournant l'array contenant les mails
  def take_emails
    @city_emails
  end

  # Méthode à appeler sur la classe pour lancer le programme de scrapping
  def perform
    puts "\nVeuillez patienter pendant que nous traitons votre requête de scrapping !\n"
    take_all_the_urls_of_an_area
    puts "Cette opération peut durer un long moment selon la configuration de votre matériel..."
    take_all_areanames_from_webpages
    puts "Le scrapping est maintenant terminé."
  end
end
