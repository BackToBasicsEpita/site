---
title: "Indexer"
date: 2023-06-21T12:00:00+02:00
author: "Ilan Mayeux"
---

# Indexeur

Les Indexeurs sont des méthodes utiles qui permettent de réutiliser la syntaxe des listes, tableaux et dictionnaires
pour des classes customisées. Elles se comportent similairement aux Propriétés

Ce cours TP vous permettra d'acquérir ce savoir en un temps relativement court.

Cf : [Documentation Microsoft](https://docs.microsoft.com/fr-fr/dotnet/csharp/programming-guide/indexers/) (RTFM)

## Indexer.cs

```csharp
///<summary>
/// Ecrire une classe Indexer qui prend comme attributs privés un dictionnaire 
/// _dicoSI avec une clé de type string et une valeur de type int,
/// un autre _dicoII de clé int et de valeur string.
/// et un _tree de type MyTree, classe définit plus bas
/// </summary>
public class Indexer {}
public class MyTree
{
    public object Key;
    public MyTree Left;
    public MyTree Right;
}
```
```csharp
/// <summary>
/// Ecrire un indexeur pour le dictionnaire _dicoSI avec un getter 
/// qui renvoie la valeur du dictionnaire
/// et un setter qui la met à jour
/// </summary>
public int this[string key]
```

```csharp
/// <summary>
/// Ecrire un indexeur pour le dictionnaire _dicoII avec un getter qui renvoie et 
/// multiplie la valeur du dictionnaire par 86 puis ajoute 39
/// et un setter qui la met à jour en effectuant l'opération inverse sur la valeur 
/// du nombre entrant
/// </summary>
public int this[int key]
```

```csharp
/// <summary>
/// Ecrire un indexeur qui renvoie le n ième noeud de l'abre en parcours largeur.
/// S'il n'existe pas, une IndexOutOfRangeException est levée.
/// </summary>
public MyTree this[int n]
```

```csharp
/// <summary>
/// Ecrire un indexeur qui renvoie le premier noeud de l'abre en parcours largeur 
/// qui a une clé égale à celle en paramètre.
/// Si aucun noued n'est trouvé, l'indexeur renvoie null.,
/// </summary>
public MyTree? this[object key]
```

## Fin

Merci d'avoir suivi ce court TP sur les indexeurs.
N'hésitez pas à remonter tout problème sur le serveur discord
de B2B.