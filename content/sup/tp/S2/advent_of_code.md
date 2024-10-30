---
title: "Advent of Code 2022 - Partiel S2"
date: 2023-05-15T11:30:03+00:00
weight: 1
author: "Arthur"
showToc: true
description: "Advent of Code en C# pour le partiel des S2 à EPITA"
---


L'objectif du TP est de résoudre des problèmes posés dans l'Advent Of Code 2022 tout en travaillant les notions apprises en cours.

### Comment se présente un problème ?
+ Un énoncé (enfantin certes, mais vous pourrez vous arracher des cheveux dessus, ne vous inquiétez surtout pas)
+ Deux parties
+ Un exemple par partie
+ Un set de données court et un long

### Contenu
+ Partie 1: une interface pour manipuler les données facilement (difficulté: 4/10)
+ Partie 2: un exercice d'échauffement (difficulté: 2.5/10)
+ Partie 3: un exercice plus avancé (difficulté: 6.5 -> 9/10)
+ **Remarque 1: la difficulté est à considérer par rapport à celle qui peut être attendue du partiel.**
+ Remarque 2 : Une fonction dont le nom est suivi d'un * dans le sujet peut être réalisée en **une ligne** (un seul ';') -> **BONUS**.

### Notions travaillées
+ Pour tout le TP
  + LinQ
  + Gestion des exceptions
+ Partie 1 (nécessaire pour la suite!)
  + File Management
  + IEnumerable et IEnumerator
  + Indexer
  + Predicates / Lambdas
+ Parties 2 et 3
  + Capacité à analyser et résoudre un problème donné
  + Classes abstraites
+ Partie 3 (spécifiquement)
  + Orienté objet
  + Parsing de données
  + Optimisation (bonus)

### Pour setup le TP
+ Télécharger le squelette: `git clone https://github.com/aderugy/TP-S2-B2B-AOC.git` ou `git@github.com:aderugy/TP-S2-B2B-AOC.git`
+ Créer une solution
+ Créer un nouveau projet '.NET/Console Application' nommé 'Exercises' (faites attention à respecter l'archi du squelette pour éviter les conflits de namespace!)
+ Rajouter les fichiers donnés dans le squelette dans leur dossier respectif (voir la section d'après pour les tests)

### Pour tester votre projet
+ Créer un nouveau projet '.NET/Unit Test Project' **AVEC XUnit** nommé 'Tests'.
+ Glisser les fichiers de code dans leur dossier respectif !
+ Mettez le dossier 'tests' (à la racine du repo) où vous le souhaitez.
+ Remplacez le chemin d'accès dans 'Tests/Utils.cs' par celui du dossier donné.
+ Décommentez les assertions au fur et à mesure que vous avancez dans le code des tests (ExercisesTests et FileManagerTests).
+ Lancez les tests!
  + S'il y a des erreurs -> **débuggage**



# Partie 1 (Nécessaire pour la suite!)

## Exceptions.cs
**Les exceptions ne sont pas des plaies !**<br>Elles permettent de mieux savoir où et pourquoi le code n'a pas fonctionné. On va donc créer les nôtres, de la même façon que dans les TP. Elles doivent hériter de 'System.Exception'.
+ NoSolutionException
+ EmptyDatasetException
+ InvalidDataException

## FileManager.cs (hérite d'IEnumerable et d'IEnumerator)
L'interface qui nous permettra de manipuler facilement les données contenues dans les fichiers de tests. Ces données permettront de tester nos solutions aux problèmes.

### Attributs
+ `private readonly List<string> _lines;` : une liste contenant les lignes du fichier
+ `private int _index;`

### Constructeur 
+ `public FileManager(string path)`
  + path: chemin d'accès au fichier que l'on doit charger
+ Initialisation des attributs
  + \_lines doit contenir les chaque ligne du contenu du fichier
  + \_index est initialisé à -1
+ Si le fichier n'existe pas ou si c'est un dossier => FileNotFoundException
+ Si le contenu du fichier est vide => EmptyDatasetException

### Indexer
+ Rappel du prototype: `public string this[int index] { get {...} }`
+ Si l'index est en dehors des bornes de la liste => IndexOutOfRangeException

### GetEnumerator *
+ Prototype: `public IEnumerator GetEnumerator()`
+ Quel est l'IEnumerator ici ?...

### MoveNext *
+ Prototype: `public bool MoveNext()`
+ Incrémenter l'index de 1 et return true s'il est toujours dans les bornes de la liste, sinon false.

### Reset *
+ Prototype: `public void Reset()`
+ Reset l'index à sa valeur initiale (on revient au début de la liste.)

### Current *
+ Prototype : `public object Current`
+ Return l'élément correspondant à la position actuelle dans la liste.

### Ready *
+ Prototype : `public bool Ready()`
+ Return true si l'index est inférieur au nombre de lignes, sinon false.

### Remarque
+ Vous aurez à manipuler les données. Gardez en mémoire que **dans cette implémentation** l'index doit toujours se situer **une position avant celle du prochain élément qui sortira**.
+ C'est pour cette raison que l'on commence à -1 et non à 0 ! (cf. MoveNext.)
+ Si vous ne faites pas attention à cela, vous risquez de **sauter un élément** ou de le faire **sortir deux fois**.

### GetMultipleLines
+ Prototype : `public List<string> GetMultipleLines(int number)`
+ Return les N lignes **suivantes**.
+ **L'index doit se trouver à la position du dernier élément renvoyé!!!!**
+ Si number est inférieur ou égal à 0 => ArgumentException
+ S'il n'y a pas assez d'éléments => IndexOutOfRangeException

### SkipElement *
+ Prototype : `public void SkipElement()`
+ Incrémente l'index de 1.

### ApplyToAll *
+ Prototype : `public void ApplyToAll(Func<string, string> operation)`
+ Applique l'opération à toutes les lignes du fichier.
+ Remarque: 'operation' est une **fonction** 'string -> string'.

### TESTEZ VOTRE CODE (méthodologie en introduction) !!!!!

## Solution.cs

### Cette classe abstraite aura :
+ Un attribut `protected readonly FileManager _inputData;` qui nous permettra de manipuler les données
+ Un constructeur `public Solution(string path)`
  + Initialiser le FileManager
  + Supprimer tous les espaces et tabulations autour des lignes du fichier (il y a une fonction de la classe string qui s'occupe de le faire pour vous et une autre dans FileManager pour l'appliquer à tous...)
+ `public abstract long SolvePart1();`
+ `public abstract long SolvePart2();`

# Partie 2 - Exercice 1 (Day1 AOC 2022)

## LES INPUTS DONNES SERONT CORRECTS POUR TOUS LES TESTS SUR LES EXERCICES !!

Je vous recommande (très!) vivement de bien lire l'énoncé et d'essayer de **visualiser le problème**.<br>N'hésitez pas à faire des jolis dessins sur Paint si ça peut vous aider, mais réfléchir par vous même vous fera certainement beaucoup plus progresser que simplement appliquer une méthode toute faite ! Ce problème reste assez facile, et si vous avez correctement implémenté le FileManager, vous avez tous les outils pour le faire.
> **Un ingénieur est avant tout censé résoudre des problèmes, et c'est l'un des meilleurs moyens d'améliorer sa technique !**

### Enoncé partie 1 (remarque: énoncés traduits avec ChatGPT -> faites remonter s'il y a des imprécisions)

Les Elfes se relaient pour noter le nombre de Calories contenues dans les différents repas, collations, rations, etc. qu'ils ont apportés avec eux, un article par ligne. Chaque Elfe sépare son propre inventaire de l'inventaire de l'Elfe précédent (le cas échéant) par une ligne vide.

Par exemple, supposons que les Elfes finissent d'écrire les Calories de leurs articles et se retrouvent avec la liste suivante :

```
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
```

Cette liste représente les Calories de la nourriture portée par cinq Elfes :<br>
    Le premier Elfe transporte des aliments avec 1000, 2000 et 3000 Calories, soit un total de 6000 Calories.<br>
    Le deuxième Elfe transporte un aliment avec 4000 Calories.<br>
    Le troisième Elfe transporte des aliments avec 5000 et 6000 Calories, soit un total de 11000 Calories.<br>
    Le quatrième Elfe transporte des aliments avec 7000, 8000 et 9000 Calories, soit un total de 24000 Calories.<br>
    Le cinquième Elfe transporte un aliment avec 10000 Calories.<br>

Au cas où les Elfes auraient faim et auraient besoin de collations supplémentaires, ils doivent savoir à quel Elfe demander : ils aimeraient savoir combien de Calories sont transportées par l'Elfe qui transporte le plus de Calories. Dans l'exemple ci-dessus, il s'agit de 24000 (portées par le quatrième Elfe).<br>

**Trouvez l'Elfe qui transporte le plus de Calories. Combien de Calories totales cet Elfe transporte-t-il ?**


## Exercise1/SolutionEx1.cs

Cette classe hérite de 'Solution' => ajoutez lesprototypes manquants (Rider vous l'indiquera.)

### Constructeur
+ Appelle 'base' avec le path.

### IsInteger *
+ Prototype : `private static bool IsInteger(string input)`
+ return true si l'input contient au moins un caractère et uniquement des chiffres, sinon false.

### SumAllCalories (méthode principale de ce problème)
+ Prototype : `private List<int> SumAllCalories()`
+ Return une liste contenant la somme de chaque groupe de calories
+ **Remarque : utiliser uniquement des méthodes de FileManager !**
+ Exemple: si l'on reprend la liste donnée dans l'énoncé -> '\[6000, 4000, 11000, 24000, 10000\]'.

### SolvePart1
+ Return le maximum de la liste donnée par SumAllCalories.
+ S'il n'y a aucun élément -> NoSolutionException


## Enoncé partie 2

Au moment où vous calculez la réponse à la question des Elfes, ils ont déjà réalisé que l'Elfe qui transporte le plus de Calories en nourriture finirait peut-être par manquer de collations.<br>

Pour éviter cette situation inacceptable, les Elfes aimeraient plutôt connaître le total des Calories transportées par les trois premiers Elfes qui transportent le plus de Calories. Ainsi, même si l'un de ces Elfes manque de collations, ils ont encore deux réserves.<br>

Dans l'exemple ci-dessus, les trois premiers Elfes sont le quatrième Elfe (avec 24000 Calories), puis le troisième Elfe (avec 11000 Calories), puis le cinquième Elfe (avec 10000 Calories). La somme des Calories transportées par ces trois elfes est de 45000.<br>

**Trouvez les trois premiers Elfes transportant le plus de Calories. Combien de Calories ces Elfes transportent-ils au total ?**<br>

### SolvePart2
+ Return le somme des trois plus grands éléments de la liste donnée par SumAllCalories.
+ S'il n'y a pas au moins trois éléments dans la liste -> NoSolutionException.


# Partie 3 - Exercice 2 (Day11 AOC 2022)

**Même chose que pour l'exercice 1 : réflechissez au problème avant de vous lancer dans sa résolution.**

## Enoncé partie 1

Enfin, vous commencez à remonter la rivière, vous vous rendez compte que votre sac est beaucoup plus léger que vous ne vous en souveniez. Juste à ce moment-là, l'un des objets de votre sac passe en volant au-dessus de votre tête. Des singes jouent à se lancer vos affaires !<br>

Pour récupérer vos affaires, vous devez être capable de prédire où les singes lanceront vos objets. Après une observation attentive, vous vous rendez compte que les singes agissent en fonction de votre niveau d'inquiétude pour chaque objet.<br>

Vous prenez quelques notes (votre entrée de puzzle) sur les objets que chaque singe possède actuellement, sur votre niveau d'inquiétude pour ces objets et sur la manière dont le singe prend des décisions en fonction de votre niveau d'inquiétude. Par exemple :<br>

```
Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1
```

Chaque singe a plusieurs attributs : <br>
+ Les objets de départ listent votre niveau d'inquiétude pour chaque objet que le singe tient actuellement dans l'ordre où ils seront inspectés. 
+ L'opération montre comment votre niveau d'inquiétude change lorsque ce singe inspecte un objet. (Une opération comme new = old * 5 signifie que votre niveau d'inquiétude après l'inspection du singe est cinq fois ce qu'il était avant l'inspection.) 
+ Le test montre comment le singe utilise votre niveau d'inquiétude pour décider où lancer un objet ensuite. 
+ Si "vrai" montre ce qui se passe avec un objet si le test était vrai. 
+ Si "faux" montre ce qui se passe avec un objet si le test était faux. 

Après que chaque singe a inspecté un objet mais avant de tester votre niveau d'inquiétude, votre soulagement que l'inspection du singe n'ait pas endommagé l'objet fait que votre niveau d'inquiétude est divisé par trois et arrondi à l'entier le plus proche. <br>

Les singes se relaient pour inspecter et lancer des objets. À chaque tour d'un seul singe, il inspecte et lance tous les objets qu'il tient un à un et dans l'ordre indiqué. Le singe 0 commence, puis le singe 1, et ainsi de suite jusqu'à ce que chaque singe ait fait un tour. Le processus de chaque singe prenant un seul tour s'appelle un tour. <br>

Lorsqu'un singe lance un objet à un autre singe, l'objet se place à la fin de la liste du singe destinataire. Un singe qui commence un tour sans objet pourrait finir par inspecter et lancer de nombreux objets avant que son tour n'arrive. Si un singe ne tient aucun objet au début de son tour, son tour se termine.<br>

Dans l'exemple ci-dessus, le premier tour se déroule comme suit :

<details>
  <summary>Déroulement d'un tour complet</summary>
Singe 0 :<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 79.<br>
    Le niveau d'inquiétude est multiplié par 19 pour atteindre 1501.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 500.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 23.<br>
    L'objet avec un niveau d'inquiétude de 500 est lancé au singe 3.<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 98.<br>
    Le niveau d'inquiétude est multiplié par 19 pour atteindre 1862.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 620.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 23.<br>
    L'objet avec un niveau d'inquiétude de 620 est lancé au singe 3.<br>
Singe 1 :<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 54.<br>
    Le niveau d'inquiétude augmente de 6 pour atteindre 60.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 20.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 19.<br>
    L'objet avec un niveau d'inquiétude de 20 est lancé au singe 0.<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 65.<br>
    Le niveau d'inquiétude augmente de 6 pour atteindre 71.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 23.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 19.<br>
    L'objet avec un niveau d'inquiétude de 23 est lancé au singe 0.<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 75.<br>
    Le niveau d'inquiétude augmente de 6 pour atteindre 81.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 27.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 19.<br>
    L'objet avec un niveau d'inquiétude de 27 est lancé au singe 0.<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 74.<br>
    Le niveau d'inquiétude augmente de 6 pour atteindre 80.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 26.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 19.<br>
    L'objet avec un niveau d'inquiétude de 26 est lancé au singe 0.<br>
Singe 2 :<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 79.<br>
    Le niveau d'inquiétude est multiplié par lui-même pour atteindre 6241.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 2080.<br>
    Le niveau d'inquiétude actuel est divisible par 13.<br>
    L'objet avec un niveau d'inquiétude de 2080 est lancé au singe 1.<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 60.<br>
    Le niveau d'inquiétude est multiplié par lui-même pour atteindre 3600.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 1200.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 13.<br>
    L'objet avec un niveau d'inquiétude de 1200 est lancé au singe 3.<br>Update README.md
    Le singe inspecte un objet avec un niveau d'inquiétude de 97.<br>
    Le niveau d'inquiétude est multiplié par lui-même pour atteindre 9409.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 3136.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 13.<br>old
    L'objet avec un niveau d'inquiétude de 3136 est lancé au singe 3.<br>
Singe 3 :<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 74.<br>
    Le niveau d'inquiétude augmente de 3 pour atteindre 77.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 25.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 17.<br>
    L'objet avec un niveau d'inquiétude de 25 est lancé au singe 1.<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 500.<br>
    Le niveau d'inquiétude augmente de 3 pour atteindre 503.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 167.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 17.<br>
    L'objet avec un niveau d'inquiétude de 167 est lancé au singe 1.<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 620.<br>
    Le niveau d'inquiétude augmente de 3 pour atteindre 623.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 207.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 17.<br>
    L'objet avec un niveau d'inquiétude de 207 est lancé au singe 1.<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 1200.<br>
    Le niveau d'inquiétude augmente de 3 pour atteindre 1203.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3 pour atteindre 401.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 17.<br>
    L'objet avec un niveau d'inquiétude de 401 est lancé au singe 1.<br>
  Le singe inspecte un objet avec un niveau d'inquiétude de 3136.<br>
    Le niveau d'inquiétude augmente de 3 pour atteindre 3139.<br>
    Le singe s'ennuie avec l'objet. Le niveau d'inquiétude est divisé par 3Update README.md pour atteindre 1046.<br>
    Le niveau d'inquiétude actuel n'est pas divisible par 17.<br>
    L'objet avec un niveau d'inquiétude de 1046 est lancé au singe 1. <br>
  

Après le premier tour, les singes tiennent des objets avec ces niveaux d'inquiétude :<br>

Singe 0 : 20, 23, 27, 26<br>
Singe 1 : 2080, 25, 167, 207, 401, 1046<br>
Singe 2 : <br>
Singe 3 : <br>

Les singes 2 et 3 ne tiennent aucun objet à la fin du tour ; ils ont tous deux inspecté des objets pendant le tour et les ont tous lancés avant la fin du tour.<br>

Ce processus se poursuit pendant quelques tours supplémentaires :<br>

Après le deuxième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :<br>
Singe 0 : 695, 10, 71, 135, 350<br>
Singe 1 : 43, 49, 58, 55, 362<br>
Singe 2 : <br>
Singe 3 : <br>

Après le troisième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :<br>
Singe 0 : 16, 18, 21, 20, 122<br>
Singe 1 : 1468, 22, 150, 286, 739<br>
Singe 2 : <br>
Singe 3 : <br>

Après le quatrième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :<br>
Singe 0 : 491, 9, 52, 97, 248, 34<br>
Singe 1 : 39, 45, 43, 258<br>
Singe 2 : <br>old
Singe 3 : <br>

Après le cinquième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :<br>
Singe 0 : 15, 17, 16, 88, 1037<br>
Singe 1 : 20, 110, 205, 524, 72<br>
Singe 2 : <br>
Singe 3 : <br>

Après le sixième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :
Singe 0 : 8, 70, 176, 26, 34
Singe 1 : 481, 32, 36, 186, 2190
Singe 2 : 
Singe 3 : 

Après le septième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :<br>
Singe 0 : 162, 12, 14, 64, 732, 17<br>
Singe 1 : 148, 372, 55, 72<br>
Singe 2 : <br>
Singe 3 : <br>

Après le huitième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :
Singe 0 : 51, 126, 20, 26, 136
Singe 1 : 343, 26, 30, 1546, 36
Singe 2 : 
Singe 3 : 

Après le neuvième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :<br>
Singe 0 : 116, 10, 12, 517, 14<br>
Singe 1 : 108, 267, 43, 55, 288<br>
Singe 2 : <br>
Singe 3 : <br>

Après le dixième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :<br>
Singe 0 : 91, 16, 20, 98<br>
Singe 1 : 481, 245, 22, 26, 1092, 30<br>
Singe 2 : <br>
Singe 3 : <br>

...

Après le quinzième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :<br>
Singe 0 : 83, 44, 8, 184, 9, 20, 26, 102<br>
Singe 1 : 110, 36<br>
Singe 2 : <br>
Singe 3 : <br>

...

Après le vingtième tour, les singes tiennent des objets avec ces niveaux d'inquiétude :<br>
Singe 0 : 10, 12, 14, 26, 34<br>
Singe 1 : 245, 93, 53, 199, 115<br>
Singe 2 : <br>
Singe 3 : <br>

Poursuivre tous les singes en même temps est impossible ; vous allez devoir vous concentrer sur les deux singes les plus actifs si vous voulez avoir une chance de récupérer vos affaires. Comptez le nombre total de fois que chaque singe inspecte des objets sur 20 tours :<br>

Le singe 0 a inspecté des objets 101 fois.<br>
Le singe 1 a inspecté des objets 95 fois.<br>
Le singe 2 a inspecté des objets 7 fois.<br>
Le singe 3 a inspecté des objets 105 fois.<br>

  </details>
  Dans cet exemple, les deux singes **les plus actifs ont inspecté des objets 101 et 105 fois**.<br>
  <br>
  **CONSIGNE**
  **Le résultat dans cette situation peut être trouvé en multipliant les deux plus grands nombres d'inspections parmi les singes ensemble : 10605**.<br>
  **Découvrez quels singes poursuivre en comptant combien d'objets ils inspectent sur 20 tours. Quel est le résultat après 20 tours ?**

## Exercise2/Monkey.cs
+ Cette classe nous permettra de simuler le comportement d'un singe tel qu'il l'est décrit dans l'énoncé.
+ Pourquoi avoir créé une classe ?
  + On peut voir dans les données qu'on aura plusieurs singes à simuler.
  + On devra donc instancier plusieurs objets au comportement similaire.
  + C'est précisement le but de l'orienté objet !
    + Les attributs correspondent aux données initiales de nos singes (ex: l'inventaire, le test, les cibles selon le résultat du test...)
    + Les comportements seront simulés par des **lambdas**, ie. des fonctions 'stockées dans des variables' (plus exactement définie lorsque l'on lance le programme et en s'appuyant sur des données calculées at runtime)
  + Ces comportements / attributs seront extraits des données, il faudra faire un parser (simple.)

### Attributs
+ `private readonly Queue<long> _inventory;` : les objets tenus par un singe
> On utilise une queue car on veut sortir les éléments **dans l'ordre d'arrivée**.
+ `private readonly Func<long, long> _operation;` : L'opération appliquée à un objet lors de l'inspection.
+ `public readonly int Divider;` : le diviseur du test de divisibilité lors de l'inspection.
+ `private readonly int _targetTestTrue;` : le numéro du singe auquel renvoyer l'objet si le test échoue.
+ `private readonly int _targetTestFalse;` : le numéro du singe auquel renvoyer l'objet si le test réussi.
+ `public int InspectionCount = 0;` : on comptera le nombre de fois qu'un singe inspecte un objet.

### Constructeur
+ Prototype : `public Monkey(Queue<long> inventory, Func<long, long> operation, int divider, int targetTestTrue, int targetTestFalse)`

### HasItemsLeft *
+ Prorotype :`public bool HasItemsLeft()`

### GetNextItem *
+ Prototype : `public long GetNextItem()`
+ Dequeue un objet et le return.

### AddItem *
+ Prorotype : `public void AddItem(long item)`
+ Ajouter un objet à l'inventaire.

### ApplyOperation *
+ Prototype : `public long ApplyOperation()`
+ Appliquer l'opération (voir les attributs) au prochain objet dans l'inventaire.

### Test *
+ Prototype : `public int Test(long value)`
+ Vérifier si value est divisible par Diviser et return le bon attribut en conséquence **(regardez les attributes !!)**

### ParseMonkeyInventory *
+ Prototype : `public static IEnumerable<long> ParseMonkeyInventory(string data)`
+ Remarque: long = un integer de 64 bits
> Exemple: `Starting items: 79, 98` -> `[79, 98]`

### ParseMonkeyOperation
+ Prototype : `public static Func<long, long> ParseOperation(string data)`
+ Vous devez return une lambda
  + Type: 'long -> long'
  + Paramètre: old (long)
  + Opérateurs pris en charge : '+, -, /, \*'
  + Méthodologie :
  + L'opération est de la forme 'Operation: new = {MEMBRE DE GAUCHE} {OPERATEUR} {MEMBRE DE DROITE}'
    + Trouver la valeur du membre gauche et du membre droit de l'opération
    + Si c'est "old", remplacer par la valeur de old en paramètre, sinon c'est la valeur du membre de l'opération
    + Faire le calcul avec l'opérateur...
    + ** ON TRAVAILLE AVEC DES 'LONG' ICI**
> Cette méthode peut s'avérer compliquée à implémenter. Voir le cours de Gollum sur les lambdas !
> Exemple: 'Operation: new = old * 19' : `(old) => { return old * 19;}  // CECI EST UNE FONCTION LAMBDA... à vous de l'automatiser`
> Petit rappel: une lambda se définit de la façon suivante
```
(type1 param1, type2 param2...) => {
  // Des choses à faire;
  return value;
}
```

<details>
  <summary>ParseMonkeyOperation corrigée (essayez avant!!!)</summary>
  Désolé pour le formattage pas trouvé !<br>
  public static Func<long, long> ParseMonkeyOperation(string data)
    {
        string[] operation = data[(data.IndexOf('=') + 2)..].Split(' ');
        
        if (operation.Length != 3 || operation[1].Length != 1)
            throw new InvalidDataException();

        return (old) =>
        {
            long leftMember = operation[0] == "old" ? old : Convert.ToInt64(operation[0]);
            long rightMember = operation[2] == "old" ? old : Convert.ToInt64(operation[2]);

            return operation[1][0] switch
            {
                '+' => leftMember + rightMember,
                '-' => leftMember - rightMember,
                '/' => leftMember / rightMember,
                '*' => leftMember * rightMember,
                _ => throw new InvalidDataException()
            };
        };
    }
  
  </details>

### GetLastValueAsInt *
+ Prototype : `public static int GetLastValueAsInt(string data)`
+ Extraire le dernier 'mot' d'un string et return sa valeur en int.
> Exemple : GetLastValueAsInt('Test: divisible by 19') -> 19

### Parse (La fonction la plus importante de la classe !)
+ Prototype : `public static Monkey Parse(List<string> data)`
+ Convertit une liste de string en une instance de la classe Monkey.
+ S'il n'y a pas exactement 6 éléments dans data -> InvalidDataException
+ De manière générale, s'il y a une exception lors de l'extraction des données -> InvalidDataException 
> Vous devez gérer TOUTES les exceptions qui peuvent survenir, il existe une notation qui permet de gérer efficacement les exceptions...)
+ Vous utiliserez les fonctions définies avant celle-ci pour récupérer toutes les données nécessaires à l'instantiation d'un Monkey.

## Exercise2/SolutionEx2.cs

### Attributes
+ `private readonly List<Monkey> _monkeys;` : la liste contenant toutes nos instances des singes

### Constructeur
+ Appeler le constructeur 'base' avec en argument 'path'.
+ Initialiser \_monkeys avec une liste vide.
+ Tant que le l'\_inputData est prêt:
  + Lire 6 lignes du fichier
  + Créer un Monkey avec ces données
  + L'ajouter à notre liste de singes
  + Skip une ligne (il y a une newline entre chaque définition de singe dans notre set de données!)

### SolvePart1
+ Il y a **20 tours**.
+ Chaque tour consiste en:
  + Pour chaque singe:
    + Tant qu'il lui reste des objets: 
      + Récupérer la valeur de l'objet qu'il étudie (le résultat de l'application de son opération divisé par 3)
      + Trouver à qui renvoyer l'objet (en effectuant le test) => l'index de la cible dans la liste de singes
      + Incrémenter l'InspectionCount
      + Rajouter l'objet au singe correspondant dans la liste
+ Déterminer les deux singes avec le plus grand InspectionCount, multiplier ces deux valeurs entre elles et en return le produit.

## Enoncé partie 2

Tu es inquiet de ne peut-être jamais récupérer tes objets. Si inquiet, en fait, que ton soulagement qu'une inspection de singe n'ait pas endommagé un objet ne divise plus ton niveau d'inquiétude par trois.<br>

Malheureusement, ce soulagement était tout ce qui empêchait tes niveaux d'inquiétude d'atteindre des niveaux ridicules. Tu devras trouver une autre manière de garder tes niveaux d'inquiétude gérables.<br>

À ce rythme, tu risques de supporter ces singes pendant très longtemps - peut-être 10000 tours !<br>

Avec ces nouvelles règles, tu peux encore comprendre les singeries après 10000 tours. En utilisant le même exemple ci-dessus :<br>

<details>
  <summary>Exemple d'un tour</summary>
== Après le tour 1 ==<br>
Singe 0 a inspecté les objets 2 fois.<br>
Singe 1 a inspecté les objets 4 fois.<br>
Singe 2 a inspecté les objets 3 fois.<br>
Singe 3 a inspecté les objets 6 fois.<br>

== Après le tour 20 ==<br>
Singe 0 a inspecté les objets 99 fois.<br>
Singe 1 a inspecté les objets 97 fois.<br>
Singe 2 a inspecté les objets 8 fois.<br>
Singe 3 a inspecté les objets 103 fois.<br>

== Après le tour 1000 ==<br>
Singe 0 a inspecté les objets 5204 fois.<br>
Singe 1 a inspecté les objets 4792 fois.<br>
Singe 2 a inspecté les objets 199 fois.<br>
Singe 3 a inspecté les objets 5192 fois.<br>

== Après le tour 2000 ==<br>
Singe 0 a inspecté les objets 10419 fois.<br>
Singe 1 a inspecté les objets 9577 fois.<br>
Singe 2 a inspecté les objets 392 fois.<br>
Singe 3 a inspecté les objets 10391 fois.<br>

== Après le tour 3000 ==<br>
Singe 0 a inspecté les objets 15638 fois.<br>
Singe 1 a inspecté les objets 14358 fois.<br>
Singe 2 a inspecté les objets 587 fois.<br>
Singe 3 a inspecté les objets 15593 fois.<br>

== Après le tour 4000 ==<br>
Singe 0 a inspecté les objets 20858 fois.<br>
Singe 1 a inspecté les objets 19138 fois.<br>
Singe 2 a inspecté les objets 780 fois.<br>
Singe 3 a inspecté les objets 20797 fois.<br>

== Après le tour 5000 ==<br>
Singe 0 a inspecté les objets 26075 fois.<br>
Singe 1 a inspecté les objets 23921 fois.<br>
Singe 2 a inspecté les objets 974 fois.<br>
Singe 3 a inspecté les objets 26000 fois.<br>

== Après le tour 6000 ==<br>
Singe 0 a inspecté les objets 31294 fois.<br>
Singe 1 a inspecté les objets 28702 fois.<br>
Singe 2 a inspecté les objets 1165 fois.<br>
Singe 3 a inspecté les objets 31204 fois.<br>

== Après le tour 7000 ==<br>
Singe 0 a inspecté les objets 36508 fois.<br>
Singe 1 a inspecté les objets 33488 fois.<br>
Singe 2 a inspecté les objets 1360 fois.<br>
Singe 3 a inspecté les objets 36400 fois.<br>

== Après le tour 8000 ==<br>
Singe 0 a inspecté les objets 41728 fois.<br>
Singe 1 a inspecté les objets 38268 fois.<br>
Singe 2 a inspecté les objets 1553 fois.<br>
Singe 3 a inspecté les objets 41606 fois.<br>

== Après le tour 9000 ==<br>
Singe 0 a inspecté les objets 46945 fois.<br>
Singe 1 a inspecté les objets 43051 fois.<br>
Singe 2 a inspecté les objets 1746 fois.<br>
Singe 3 a inspecté les objets 46807 fois.<br>

== Après le tour 10000 ==<br>
Singe 0 a inspecté les objets 52166 fois.<br>
Singe 1 a inspecté les objets 47830 fois.<br>
Singe 2 a inspecté les objets 1938 fois.<br>
Singe 3 a inspecté les objets 52013 fois.<br>
</details>

Après 10000 tours, les deux singes les plus actifs ont inspecté les objets 52166 et 52013 fois.<br> **En multipliant ces chiffres ensemble, le résultat est maintenant de 2713310158.**<br>

**Les niveaux d'inquiétude ne sont plus divisés par trois après chaque inspection d'objet**; tu devras trouver une autre manière de garder tes niveaux d'inquiétude gérables. <br>
**En repartant de l'état initial dans les données de ton puzzle, quel est le niveau de singeries après 10000 tours ?**

### SolvePart2 (**QUESTION BONUS**)
+ Il y a **10000 tours**
+ Le fonctionnement d'un tour est le même sauf **qu'on ne divise pas par 3 le résultat de l'application**
+ Si vous essayez vous verrez qu'il faut optimiser quelque chose... :)
> Indice: p et q deux entiers premiers, n un naturel -> p divise n => p divise n % (p * q)

# FIN

Si vous avez réussi à finir, vous aurez une excellente note au partiel :)<br>
Sinon, pas de panique, le sujet est devenu vraiment difficile à partir de ParseMonkeyOperation.
