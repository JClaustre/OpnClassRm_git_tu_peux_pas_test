GIT README 
===============
*Author: J. Claustre*

*Date  : 12/2015*

Description
-----------

Voici un code qui ne sert pas a grand chose!
Meme si il ne sert a rien, il utilise pas mal de processeurs! :D

Installer
-----------

1. Telecharger le projet sur votre machine. (bouton download dans le
   haut a droite de la page!)
2. de-zip le fichier

### Sur Linux
* Pour De-zipper avec le terminal :

		unzip file.zip -d destination_folder

* Une fois dans le repertoire de destination, compiler (peut aussi se
  compiler avec *gcc* normalement, dans ce cas pas besoin de la
  librairie *-lgfortran*) :

		gfortran -o run -lgfortran -lm -fopenmp f90_kind.f90 loop.f90 inner-outer_loop.f90

* Pour etre sur d'utiliser tous les processeurs, inscrivez dans le terminal :

		export OMP_NUM_THREADS=8

Run it ( en anglais pour changer )!
-----------


After the code compiled perfectly, you should have an executale
*run*. In a Linux terminal, wrote the command

        ./run

Want to Contribute (un peu lazy ... deja vu ca quelque part! :D )?
--------------------

1. Fork it
2. Create your own feature branch (`git checkout -b my-own-new-feature`)
3. Commit your changes (`git commit -am "Add some changes"`)
4. Push to the branch (`git push origin my-own-new-feature`)
5. Create new Pull Request
