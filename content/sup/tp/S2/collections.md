---
title: "Collections"
date: 2023-06-19T17:55:42+02:00
author: Greg
---

# Introduction

Au cours de ce sujet, nous allons aborder les collections en C#. 
Avant de commencer, je vous invite à lire [cette page](https://learn.microsoft.com/fr-fr/dotnet/csharp/programming-guide/concepts/collections)
afin de vous mettre en jambes. Vous y trouverez par ailleurs tous outils
nécessaires pour réaliser ce TP de révision. 

Ce TP se déroulera en 2 parties, et abordera les collections suivantes (une par
partie) :
- Listes
- Dictionnaires


# Listes

Pour s'entrainer à manipuler les listes, vous allez pouvoir faire quelques
fonctions qui manipulent les listes afin de mieux les maîtriser. 

## Tri fusion

Nous allons faire ici deux fonctions qui font toutes les deux un tri fusion,
mais de manière très différente : 

```csharp
/// <summary>
/// Tri la liste <param>list</param> sans la modifier.
/// </summary>
/// <return>
/// Retourne la liste triée
/// </return>
public static List<int> TriFusion(List<int> list) {}
```
```csharp
/// <summary>
/// Tri la liste <param>list</param> en place.
/// </summary>
/// <return>
/// Retourne la liste triée
/// </return>
/// <remark>
/// Vous pouvez créer vos propres fonctions.
/// </remark>
public static void TriFusion(List<int> list) {}
```

## Des partitions

On dit qu'une liste est une partition avec une valeur pivot si : 
1. La valeur pivot est dans la liste
2. Les valeurs à gauche du pivot sont inférieures ou égales au pivot
3. Les valeurs à droite du pivot sont supérieures ou égales au pivot

```csharp
/// <summary>
/// Cherche un pivot dans une liste.
/// </summary>
/// <return>
/// L'indexe du pivot. Si plusieurs pivots sont trouvés, retourner le premier.
/// Si il n'y a pas de pivot, retourner `-1`
/// </return>
public static int FindPivot(List<int> list) {}
```

Rajoutons maintenant une nouvelle condition : 
4. Il faut que les valeurs à gauche du pivot soient triées par ordre croissant.
5. Il faut que les valeurs à droite du pivot soient triées par ordre
   décroissant.

En suivant les même spécifications, voici la fonction à écrire : 
```csharp
/// <summary>
/// Cherche un pivot dans une liste.
/// </summary>
/// <return>
/// L'indexe du pivot. Si plusieurs pivots sont trouvés, retourner le premier.
/// Si il n'y a pas de pivot, retourner `-1`
/// </return>
public static int FindPivotSorted(List<int> list) {}
```


# Les Dictionnaires

## Le Morse
Pour s'entrainer à l'utilisation des dictionnaires, vous allez commencer par
implémenter une fonction qui vous permettra de décoder le langage morse. 
Les messages codés seront de la forme suivante (chaque lettre est séparée par un
espace) :
```
-... .. . -. / .--- --- ..- . / - ..- / .- ... / - .-. --- ..- ...- . / .-.. . / -- . ... ... .- --. . / -.-. .- -.-. .... .
```

{{< figure src="resources/images/morse.png" width=200 caption="Code Morse International" >}}


### Création du dictionnaire

La première étape est d'abord de créer un dictionnaire. Pour ce faire, vous
pouvez créer la classe statique `Morse` qui contiendra la propriété
`Dictionary<string, char> MorseToLetter`. 

### Décodons tout ça !

```csharp
/// <summary>
/// Encode une chaine en morse (en séparant chaque lettre par un espace)
/// </summary>
public static string DecodeMorse(string message) {}
```


## Analyse fréquentielle

Dans cette partie, vous allez devoir compter les mots d'un texte pour ensuite
fournir des informations à l'utilisateur. Vous devrez afficher des informations
dans la console : 
- Nombre de mots
- Nombre de mots différents
- Le mot le plus fréquent
- Le mot le moins fréquent

Vous utiliserez bien entendu un dictionnaire pour regrouper toutes ces
informations.

```csharp
/// <summary>
/// Affiche des informations sur un texte
/// </summary>
public static void DisplayInfo(string text) {}
```

