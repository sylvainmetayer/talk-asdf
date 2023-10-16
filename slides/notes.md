# Notes

Présentation : plus orientée automatisation devops et que dans le cadre de mon boulot, à forcer d'automatiser tout pourquoi pas automatiser mon pc

Problématique :

Côté devops, et programmation de manières générale, pleins d'outils qui évolue parfois vite. Trop vite.

Et on se retrouve avec des projets qui suivent niveau versions et d'autres qui restent sur des vieilles versions.

Et il faut pourtant utiliser les 2

Solution / plan :  Installation / Concepts / Usage /Création d'un plugin

Plugins : Mentionner asdf-community pour les plugins les plus connus / maintenus

.tools version : On peut/doit commit ce fichier au même titre que le gitignore

shims : Le dossier ~/.asdf/shims contient les binaires de la versions actuelles.
Ces scripts sont des wrappers qui permettent de déterminer dynamiquement (selon le dossier ~/.tool-versions...) la version à utiliser. Ensuite, le binaire est appelé depuis le dossier ~/.asdf/install/<tool>/<version>/bin/<bin>

!!! démo : Préciser que c'est les démos seront avec node, mais que asdf permet de gérer terraform, age, ...

latest-stable : Si header location avec n° version présent, on prends ça comme latest, sinon on prends la première du list-all

pour aller plus loin : gestion plugins installés via un fichier... Plugin asdf !
