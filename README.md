# Mass_emailing program

This program is designed to scrap all email addresses of townhalls in the following French departments :

- Alpes-Maritimes (06)
- Bouches-du-Rhône (13)
- Morbihan (56)

It then send an email to each of these townhalls to raise their awareness about **The Hacking Project** , a French startup which seeks to
re-shape education

## Authors

François Dasylva, Jérémy Rak, Hadia Bouria, Nicolas Zhao, Valérie  Chang, Nicolas Culerier

## Repository's structure and program's logic

the db directory contains the necessary csv file where we store and from which we later use the data to send emails to corresponding townhalls

the lib directory contains two sub-directories:
- app: here are stored files each one dealing with a specific task, scrapping, mailing, twittering (yeah I just made up that verb)

- views: allows you to have a nice interface to enhance your user-experience! You don't need to edit them.

app.rb is the key file you have to load in the parent directory. The gitignore, rubocop and Gemfile do not need to be edited

## How to use it?

Clone it to your local machine with ```git clone```, go into the corresponding directory on your machine and run ```bundle install```

Gems: dotenv, nokogiri, gmail, csv, twitter (Ruby version: **2.5.1**)

You should have working .env to run twitter and gmail modules , go to the corresponding .env files (check the path used in the code) and also don't forget to change ```townhalls_adder_to_db.rb```, ```townhalls_follower.rb``` and ```townhalls_mailer.rb``` to configure everything accordingly.

Once everything is configured, just run the file ```app.rb``` and follow instructions in the terminal! You choose what you do!

## Number of emails sent, Twitter handle and script of the email

Script of the email: 

"Mon prénom est Marcel, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour consiste à envoyer (avec du codage) des emails aux mairies. De cette manière, on espère leur aide pour faire de The Hacking Project une nouvelle manière de se former pour tous.

Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{townhalls_names[i]} veut changer le monde avec nous ?

Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : appelez le 06.95.46.60.80

Cordialement,

Marcel"

Townhalls reached: 609

Have fun !!! :+1: :+1: :+1:
