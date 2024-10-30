---
title: "Marokanar"
description: "Maitriser les interfaces"
date: 2024-03-05T22:33:55+01:00
author: ["Julie"]
---

# Introduction

La *Marokanar* est le lieu réunissant le plus grand nombre de canards skaters au
monde ! Cette nuit, un concours est prévu, et l'heure est aux prédictions.

Aide nous à simuler cette compétition afin de trouver quel canard va être le
gagnant !

Voici l'architecture que va suivre le TP :

```
.
├── README.md
├── Marokanar/
│   ├── Marokanar.csproj
│   ├── Skate.cs
│   └── Canards/
│       ├── ICanard.cs
│       ├── Caneton.cs
│       ├── CanardAdulte.cs
│       ├── Canaradormi.cs
│       ├── Canarcdc.cs
│       └── VieuxCrouton.cs
└── Marokanar.sln
```

# Faire un Skate

Pour simuler une compétition de skate, il nous faut tout d'abord des skate.

Voici les propriétés de ce fameux skate :

```cs
public int Speed { get; set; }
```

## Constructeur

Ajoute un constructeur à la classe `Skate`.

```cs
public Skate(int speed) { }
```

## De la copie

Un skate, ça peut se copier. Écris un constructeur qui initialise la vitesse
comme étant la même que le skate en paramètre.

```cs
public Skate(Skate s) { }
```

## Combinaison de skates

La légende raconte que l'un des meilleur skaters au monde avait conçu son skate
en combinant 2 existants.

Écrit une méthode qui permet d'additionner 2 skates ensemble, et d'en renvoyer
un nouveau.

La vitesse de ce nouveau skate correspond à la somme des skates précédents.

```cs
public static Skate operator+(Skate skate1, Skate skate2) { }
```

# Nos canards

Des skates c'est bien, mais il nous faut des canards pour les utiliser.

Écris une interface `ICanard.cs`, avec les méthodes suivantes :

```cs
// Fait quack tout seul
public string Quack();
// Fait quack en considérant le canard en face
public string Quack(ICanard canard);
```

## Des petits canetons

Il y a plein de canetons qui sont venus regarder la compétition. Étant trop
jeunes pour participer, ils restent sur le côté et font "Quack !" dans leur coin.
Quand ils sont en face de quelqu'un, un seul petit "quack" peut se faire entendre.

```cs
public string Quack() { }
public string Quack(ICanard canard) { }
```

## Des canards adultes

Écris une classe *abstraite* `CanardAdulte` qui implémente `ICanard` (hérite de
`ICanard`).
Cette classe va représenter tous les canards pouvant participer à la compétition.

Voici les propriétés de ces fameux canards :

```cs
public string Nom { get; set; }
public int Argent { get; }
public int Position { get; }
public Skate Skate { get; set; }
```

### C'est leur de la compet !

Tous les canards adultes peuvent faire du skate, ils ont donc besoin d'une
méthode pour se déplacer. Voici le prototype de cette méthode, elle sera
implémentée dans les classes filles.

```cs
public abstract void Move();
```

### Des paris, plein de paris

Écris une méthode qui retire le montant de l'argent du canard. Renvoie `false`
si le canard n'a pas assez d'argent, sinon `true`.

```cs
public bool Parier(int montant) { }
```

### Et c'est gagné !

Écris une méthode qui met à jour l'argent du canard et renvoie la réaction du
canard à l'annonce des gagnants.

Si le montant en paramètre vaut 0, cela indique qu'il a perdu, et qu'il ne
récupère pas l'argent qu'il a parié.

Dans le cas contraire, il faut ajouter ce montant à l'argent du canard.

Pour ce qui est de la réaction, un canard a tendances à dire "Youpi!" après
avoir gagné, et "Mince..." quand il a perdu.

```cs
public virtual string RecupererPari(int montantGagne) { }
```

## Un canard en forme !

L'un des premiers groupe de canards à la compétition sont très en forme !
Sûrement car ils ont très bien dormi.

Écris une classe `Canaradormi` qui hérite de `CanardAdulte`.

### Constructeur

Écris un constructeur pour ce canard très en forme. La position du canard
démarre toujours à 0.

```cs
public Canaradormi(string nom, int argent, Skate skate) { }
```

### Enfin un canard qui skate !

Un `Canaradormi` est prêt pour faire du skate. Implémente la méthode abstraite
`Move` décrite dans le `CanardAdulte`. Étant en forme, à chaque déplacement, 
la vitesse du skate actuel va être ajoutée à la position du canard.

```cs
public override void Move() { }
```

### Vraiment très en forme

Un *Canaradormi*, c'est toujours très enthousiaste. Ils font toujours "QUACK!",
peut-importe qu'ils soient seuls ou en face de quelqu'un.

```cs
public string Quack() { }
public string Quack(ICanard canard) { }
```

## Canarcdc

Un autre groupe de canard fait son entrée : les `Canarcdc`. Malheureusement,
ils ont passé toute la nuit à travailler pour leurs sups, et ne sont donc pas
très en forme.

Écris une classe `Canarcdc` qui hérite de `CanardAdulte`.

### Constructeur

Écris un constructeur pour ces canards fatigués. La position du canard
démarre toujours à 0.

```cs
public Canarcdc(string nom, int argent, Skate skate) { }
```

### Et mantenant il faut faire du skate

Implémente la méthode abstraite `Move` décrite dans le `CanardAdulte`.
Étant très fatigués, à chaque déplacement, c'est seulement la `vitesse du skate - 2`
qui va être ajoutée à la position du canard.

```cs
public override void Move() { }
```

### Des quacks fatigués

Un *Canardcdc* répond un "Quack" poli à tous les gens qu'il croise. Quand
il est seul, un "quack..." soupiré peut se faire entendre.

```cs
public string Quack() { }
public string Quack(ICanard canard) { }
```

## Et la limite d'age ?

Étonnament, un groupe de Senior vient d'arriver à la compétition. Ils ont l'air
de vouloir participer à la compétition, mais ont très vite agacé tous les
participants, et obtenu le surnom de *Vieux Crouton*.

Écris une classe `VieuxCrouton` qui hérite de `CanardAdulte`.

### Constructeur

Écris un constructeur pour ces canards. La position du canard
démarre toujours à 0.

```cs
public VieuxCrouton(string nom, int argent, Skate skate) { }
```

### Et mantenant il faut faire du skate

Implémente la méthode abstraite `Move` décrite dans le `CanardAdulte`.
À chaque déplacement, ces vieux crontons avance uniquement de la moitié de la
vitesse du skate.

```cs
public override void Move() { }
```

### Un air supérieur dès les salutations

Les vieux croutons ne sont polis qu'entre eux. Un "Quack." poli peut se faire
entendre entre croutons. En revanche, s'ils s'adressent à un autre canard, 
aucun d'eux ne dira rien. Quand ils sont seuls, ils ne font que juger au loin,
pas de quack là non plus !

```cs
public string Quack() { }
public string Quack(ICanard canard) { }
```

### Perdre un pari ? Impossible !

Un vieux crouton, ça n'aime pas perdre. Écris la fonction `RecupererPari`
des croutons. Elle fonctionne exactement pareil qu'avant à *un* détail prêt :
dans le cas où le canard perd, un "C'est un complot !" peut se faire entendre
dans la salle.

> Il faut utiliser le mot clé `base` dans cette méthode.

```cs
public override string RecupererPari(int montant) { }
```
