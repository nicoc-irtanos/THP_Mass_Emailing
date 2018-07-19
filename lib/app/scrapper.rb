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
    @dept1_link = "http://annuaire-des-mairies.com/bouches-du-rhone.html"
    @dept2_link = "http://www.annuaire-des-mairies.com/morbihan.html"
    @dept3_link = "http://www.annuaire-des-mairies.com/loire-atlantique.html"
  end

  # Code qui récupère toutes les url de villes d'un département.
  def get_all_the_urls_of_an_area(dlink)
    page = Nokogiri::HTML(open(dlink))
    page.css('.lientxt').each do |url|
      web = "http://annuaire-des-mairies.com"
      web << url['href'][1..-1]
      @city_urls << web
    end
  end

  # Code qui récupère tous les noms de villes d'un département.
  def get_the_name_of_a_townhal_from_its_webpage(dlink)
    page = Nokogiri::HTML(open(dlink))
    page.css('.lientxt').each do |name|
      @city_names << name.text
    end
  end

  # Code qui récupère le nom du département à partir de l'url d'une mairie
  def get_all_areanames_from_webpages
    @city_urls.each do |city_url|
      page = Nokogiri::HTML(open(city_url))
      page.css('body > div > main > section.text-center.well.well-sm > div > div > div > p.lead > a').each do |dept|
        @city_depts << dept.text
      end
    end
  end

  # Code qui récupère l'adresse email à partir de l'url d'une mairie
  def get_the_email_of_a_townhal_from_its_webpage(url_array)
    doc = Nokogiri::HTML(open(url_array))
    doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
      @city_emails << email.text
    end
  end

  # Boucle qui récupère toutes les adresses email des mairies des départements
  def get_all_emails_from_an_area_townhalls
    @city_urls.each do |city_url|
      get_the_email_of_a_townhal_from_its_webpage(city_url)
    end
  end
  
  def get_names
    return @city_names
  end

  def get_depts
    return @city_depts
  end

  def get_emails
    return @city_emails
  end

  # Boucle Bonus qui enregistre les données scrappées dans un array d'hash et l'affiche
  def perform
    get_all_the_urls_of_an_area(@dept1_link)
    get_all_the_urls_of_an_area(@dept2_link)
    get_all_the_urls_of_an_area(@dept3_link)
    get_all_areanames_from_webpages
    get_the_name_of_a_townhal_from_its_webpage(@dept1_link)
    get_the_name_of_a_townhal_from_its_webpage(@dept2_link)
    get_the_name_of_a_townhal_from_its_webpage(@dept3_link)
    get_all_emails_from_an_area_townhalls
  end
end