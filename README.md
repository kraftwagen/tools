# Kraftwagen - Tools

Some people prefer not to install [Drush](http://www.drupal.org/project/drush)
and its extensions globally. Instead, they keep a copy of Drush and all 
required extensions per project. 

Although the reasoning behind this preference is valid (version fixing of tools
and some other reasons), I personally don't like this approach. Just like I 
don't keep a seperate hammer for every doghouse I build, I don't keep a 
seperate drush for every Drupal site I build. (No, I never build doghouses.)

This tool implements the 'hammer for every doghouse'-approach. Clone the GitHub
repository (making this clone your Kraftwagen 'tools' directory is very valid
choice) and run ``setup.sh``. It will download Drush and Lenkrad.