Les targets:
Il permet de définir les appareils et la version d'IOS cible de l'app et l'orientation de l'écran. Il permet aussi de donner une version de révision (version de sortie), de donner un catégorie 
a notre appli pour qu'elle soit correctement répertoriée dans l'AppStore, il définit également les framewoks utilisés, les assets et l'icone de l'app.

Les fichiers:
Ce sont les fichiers de code de l'app, on y trouve également un apprecu de l'app (Main) le LaunchScreen (écran de chargement de l'app') et les Assets.

Les Assets:
C'est l'endroit ou es répertorié tous les assets que l'on utilise pour notre app, images, vidéos, icone etc...

Le storyBoard:
C'est notre espace de travail, on peut y ouvrir plusieurs onglets et accedder a différents menus.

Le simulateur:
Il nous permet de simuler notre app sur le Device choisit (émulateur) (utile pour les developpeurs)

Raccourci CMD + r:
Permet de RUN l'App

Raccourci CMD + shift + O:
Permet d'ouvrir un fichier rapidement

Raccourci indentation:
Ctrl + i

Raccourci commenter la selection:
CMD + /

Pour changer d'appareil lors de la simulation, il y a une liste déroulante en haut de la fenetre.

Variable Statique:
L'interet dans ce cas précis est que l'on peut accedder a cette variable de la structure sans avoir a en déclarer une instance. Elle
sera "Globale" a la classe et on y aura toujours accès

Importance de dequeueReusableCell :
L'utilisation de dequeueReusableCell est importante pour les performances de l'application, car elle permet de réutiliser les cellules qui sortent de l'écran. Cela évite de stocker toutes les données dans la tableView, mais seulement celles qui sont actuellement affichées. Cette technique de réutilisation des cellules contribue à optimiser l'utilisation de la mémoire et à améliorer les performances globales de l'interface utilisateur.

Que venons nous de faire en réalité ? Quel est le rôle du NavigationController ?
En intégrant l'UITableViewController dans un UINavigationController, nous avons amélioré la gestion de la navigation dans notre application et ajouté une barre de navigation pour faciliter cette navigation.
Le rôle de NavigationController est de faciliter la navigation entre les vues. Il maintient une pile de vues et fournit des transitiosn animées.

Est-ce que la NavigationBar est la même chose que le NavigationController ?
Le UINavigationController est un contrôleur de navigation qui gère la pile de vues (View Controllers) dans une application iOS.
La UINavigationBar est un composant visuel spécifique utilisé pour afficher des éléments de navigation en haut de l'écran, généralement dans le cadre d'un 'UINavigationController'

Segue:
Un lien qui permet la navigation entre les pages

Constraint:
Ce sont les contraintes de miension et d'affichage de l'image. AutoLayout permet d'ajuster la taille automatiquement.