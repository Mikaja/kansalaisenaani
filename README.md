

# Tämä on Kansalaisen ääni - sovelluksen pre-alpha versio.

Se pohjautuu koodiin, joka löytyy seuraavista lähteistä
 
[*Ruby on Rails Tutorial*](http://www.railstutorial.org/book/beginning#sec-version_control)

[*Getting Started with Rails*](http://guides.rubyonrails.org/getting_started.html)

Ohjelma on testattu Windows 7, IE 11 ympäristössä.

Ruby on Rails kehitysympäristö Windowsille on saatu lataamalla ohjelmistopaketti osoitteesta 
[http://railsinstaller.org/en](http://railsinstaller.org/en)

#Ohjelman asennus omalle koneelle lyhyesti:
1. Lataa Ruby 1.9 [http://railsinstaller.org/en](http://railsinstaller.org/en)
2. Valitse suorita
3. Asennus C:\RailsInstaller hakemistoon (oletus)
4. Anna nimi ja sähköposti, jos kysytään
   name>
   email>
5. Osoitteessa [https://github.com/Mikaja/kansalaisenaani](https://github.com/Mikaja/kansalaisenaani)  
lataa kopio klikkaamalla Download ZIP
6. Kopioi kansalaisenaani-master hakemistoon C:\Sites
7. Siirry kansalaisenaani-master hakemistoon
8. C:\Sites\kansalaisenaani-master> bundle install
9. C:\Sites\kansalaisenaani-master> rake db:migrate
10. C:\Sites\kansalaisenaani-master> rails server
11. Selaimessa mene osoitteeseen http://localhost:3000/
12. Ohjelman pitäisi olla käyttövalmis
   

