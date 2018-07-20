
app.rb is the key file you have to load in the parent directory. The gitignore, rubocop and Gemfile do not need to be edited

## How to install it ?

To ensure smooth operations ;-), please follow all below instructions :

In your terminal, please go into the directory where you would like to install this program and type:<br>
git clone https://github.com/nicolasculerier/THP_Mass_Emailing.git<br>
cd THP_Mass_Emailing<br>
bundle install<br>
touch .env<br>
Open .env with your favorite text editor and paste the below text. Make sure to put your access data before saving and quitting that file.
```
CONSUMER_KEY=“replace_this_text_with_your_twitter_key”
CONSUMER_KEY_SECRET="replace_this_text_with_your_twitter_key"
ACCESS_TOKEN="replace_this_text_with_your_twitter_key"
ACCESS_TOKEN_SECRET="replace_this_text_with_your_twitter_key"

GG_USERNAME="replace_this_text_with_your_google_username"
GG_PSWD="replace_this_text_with_your_google_pasword"

BEST_WEBSITE_EVER="https://thefsilver.github.io"
```
Please see below example
```
CONSUMER_KEY=“QAVFE4hbN7XQ0uZgDEs27”
CONSUMER_KEY_SECRET=“FVpWlPkvagHPogyhwtjdB4vbxohLZAMREkDJpMF”
ACCESS_TOKEN="LfFXMZxEww1zyGZ3dUkaxWqqeSiC4l8ALjJDvvA6"
ACCESS_TOKEN_SECRET="SQT9LVnpbG8JuZ3gmuRKU5FjLpPqEZKPtOtrzV”

GG_USERNAME=“your_random@coolmail.com"
GG_PSWD=“SecUredpassword123”

BEST_WEBSITE_EVER="https://thefsilver.github.io" 
```

## How to use it?

If you followed the installation instructions properly, you should be all set to run that application as mentioned here :

Please ensure that your command line is still located in the THP_Mass_Emailing directory and run the following line :
```ruby app.rb ```

and let yourself be guided by the menu…
Yes, it’s as simple as that… 
Crazy, right ?!

Several Ruby Gems have been used to make that dream come true.
Please clap your hands for :
<a href=“https://github.com/motdotla/dotenv”>dotenv</a>
<a href=“https://github.com/sparklemotion/nokogiri”>nokogiri</a>
<a href=“https://github.com/gmailgem/gmail”>gmail</a>
pp
<a href=“https://github.com/ruby/csv”>csv</a>
<a href=“https://github.com/sferik/twitter”>twitter</a>
<a href=“https://github.com/rubocop-hq/rubocop”>rubocop</a>
<a href=“https://github.com/pry/pry”>pry</a>
and of course Ruby, version: **2.5.1**)

## Number of emails sent, Twitter handle and script of the email

Script of the email: 
```
"Mon prénom est Marcel, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour consiste à envoyer (avec du codage) des emails aux mairies. De cette manière, on espère leur aide pour faire de The Hacking Project une nouvelle manière de se former pour tous.

Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{townhalls_names[i]} veut changer le monde avec nous ?

Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : appelez le 06.95.46.60.80

Cordialement,

Marcel"
```
Townhalls reached: 609

Have fun !!! :+1: :+1: :+1:

ACCESS_TOKEN="replace_this_text_with_your_twitter_key"
ACCESS_TOKEN_SECRET="replace_this_text_with_your_twitter_key"

GG_USERNAME="replace_this_text_with_your_google_username"
GG_PSWD="replace_this_text_with_your_google_pasword"

BEST_WEBSITE_EVER="https://thefsilver.github.io"
```
Please see below example
```
CONSUMER_KEY=“QAVFE4hbN7XQ0uZgDEs27”
CONSUMER_KEY_SECRET=“FVpWlPkvagHPogyhwtjdB4vbxohLZAMREkDJpMF”
ACCESS_TOKEN="LfFXMZxEww1zyGZ3dUkaxWqqeSiC4l8ALjJDvvA6"
ACCESS_TOKEN_SECRET="SQT9LVnpbG8JuZ3gmuRKU5FjLpPqEZKPtOtrzV”

GG_USERNAME=“your_random@coolmail.com"
GG_PSWD=“SecUredpassword123”

BEST_WEBSITE_EVER="https://thefsilver.github.io" 
```

## How to use it?

If you followed the installation instructions properly, you should be all set to run that application as mentioned here :

Please ensure that your command line is still located in the THP_Mass_Emailing directory and run the following line :
ruby app.rb

and let yourself be guided by the menu…
Yes, it’s as simple as that… 
Crazy, right ?!

Several Ruby Gems have been used to make that dream come true.
Please clap your hands for :
<a href=“https://github.com/motdotla/dotenv”>dotenv</a>
<a href=“https://github.com/sparklemotion/nokogiri”>nokogiri</a>
<a href=“https://github.com/gmailgem/gmail”>gmail</a>
pp</a>
<a href=“https://github.com/ruby/csv”>csv</a>
<a href=“https://github.com/sferik/twitter”>twitter</a>
<a href=“https://github.com/rubocop-hq/rubocop”>rubocop</a>
<a href=“https://github.com/pry/pry”>pry</a>
 (Ruby version: **2.5.1**)

## Number of emails sent, Twitter handle and script of the email

Script of the email: 

"Mon prénom est Marcel, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour consiste à envoyer (avec du codage) des emails aux mairies. De cette manière, on espère leur aide pour faire de The Hacking Project une nouvelle manière de se former pour tous.

Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{townhalls_names[i]} veut changer le monde avec nous ?

Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : appelez le 06.95.46.60.80

Cordialement,

Marcel"

Townhalls reached: 609

Have fun !!! :+1: :+1: :+1:
