# Mass_emailing program

This program is designed to scrap all email addresses of townhalls in the following French departments :

- Alpes-Maritimes (06)
- Bouches-du-Rhône (13)
- Morbihan (56)

It then send an email to each of these townhalls to raise their awareness about **The Hacking Project** , a French startup which seeks to
re-shape education

## Authors

François Dasylva, Jérémy Rak, Hadia Bouria, Nicolas Zhao, Valérie  Chang, Nicolas Culerier

## How to use it?

Clone it to your local machine with ```git clone```, go into the corresponding directory on your machine and run ```bundle install```
You should have working .env to run twitter and gmail modules , go to the corresponding .env files (check the path used in the code) and also don't forget to change ```townhalls_adder_to_db.rb```, ```townhalls_follower.rb``` and ```townhalls_mailer.rb``` to configure everything accordingly.

Once everything is configured, just run the file ```app.rb``` to start emailing townhalls!

Have fun !!! :+1: :+1: :+1:
