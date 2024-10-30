---
title: "Les fichiers"
date: 2023-06-19T13:41:00+02:00
author: Greg
description: "Un TP sur la manipulation de fichiers"
tags:
    - Fichiers
---

# Introduction

Ce TP se composera de plusieurs parties indépendantes les unes des autres. Si
vous avez besoin d'aide, n'hésitez pas à poser vos questions sur le serveur
discord de BackToBasics ! 

Vous pouvez aussi trouver la documentation concernant la manipulation des fichiers juste [ici](https://learn.microsoft.com/fr-fr/dotnet/api/system.io.file?view=net-7.0).

## Partie 1 : des sudokus par milliers

Pour cette première partie, nous allons essayer de lire des grilles de sudoku
enregistrées dans des fichiers, et même d'en enregistrer de nouvelles ! 

Le but de cet exercice est de compléter une classe `Sudoku` afin de pouvoir
enregistrer et charger des grilles de sudoku provenant de fichiers textes.

Les grilles de sudoku seront enregistrées sous ce format dans les fichiers :

```text
... ..4 58.
... 721 ..3
4.3 ... ...

21. .67 ..4
.7. ... 2..
63. .49 ..1

3.6 ... ...
... 158 ..6
... ..6 95.
```
_Note : les `.` correspondent à une case vide, et seront représenté par l'entier `0`
  dans la matrice contenant le sudoku._

_Note bis : le fichier se termine par un retour à la ligne final._

### `Sudoku.cs`

Ce fichier sera l'unique fichier de code de cette partie. 
Dans ce fichier, vous devrez implémenter une classe statique `Sudoku` appartenant au
namespace `Sudoku`. Elle possèdera ces deux propriétés : 

Voici les fonctions que vous devrez implémenter : 

```cs
/// <summary>
/// Charge la grille contenue dans le fichier <param>filename</param>
/// </summary>
/// <remark>
/// Lève une exception de type `InvalidArgumentException` si le fichier n'existe
/// pas
/// </remark>
public static int[,] LoadGrid(string filename) {}

/// <summary>
/// Enregistre la grille <param>grid</param> dans le fichier
/// <param>filename</param>
/// </summary>
public static void SaveGrid(int[,] grid, string filename) {}
```





## Partie 2 : des logs

Dans cette partie, vous allez devoir écrire un fichier de log. 
Un fichier de log ne doit contenir qu'un seul message par ligne. Un message ne
doit pas s'étaler sur plusieurs lignes. 

Toute bonne ligne de log doit contenir, dans cet ordre, au moins ces
informations : 
1. La date au format de votre choix
2. L'heure, au format HH:MM:SS
3. Le niveau de log (info, avertissement, erreur)
4. Un message descriptif

### `Logs.cs`

Commencez par créer une énumération nommée `LogLevel` avec les valeurs 
suivantes : 
- Info
- Warning
- Error

Vous allez devoir écrire ces fonctions dans votre fichier : 

```cs
/// <summary>
/// Créé un fichier de log.
/// </summary>
/// <return>
/// `true` si le fichier a été créé avec succès, `false` sinon.
/// </return>
/// <remark>
/// Si ce fichier existe déjà, retourner `false` sans effectuer de modifications
/// </remark>
public static bool CreateLogFile(string filename) {}


/// <summary>
/// Supprime un fichier de log.
/// </summary>
/// <return>
/// `true` si le fichier a été supprimé avec succès, `false` sinon.
/// </return>
public static bool DeleteLogFile(string filename) {}




/// <summary>
/// Ajoute le message <param>message</param> au fichier de log
/// <param>logfile</param>
/// </summary>
public static bool AddLog(string logfile, LogLevel level, string message) {}


/// <summary>
/// Récupère toutes les lignes de log comprises entre <param>startLine</param>
/// et <param>endLine</param> (comprises).
/// </summary>
/// <remark>
/// Lève une exception `InvalidArgumentException` si le fichier est trop court
/// ou n'existe pas
/// </remark>
public static string[] GetLines(string logfile, int startLine, int endLine) {}


/// <summary>
/// Supprime la ligne <param>line</param> du fichier de log.
/// </summary>
/// <remark>
/// Lève une exception `InvalidArgumentException` si le fichier est trop court
/// ou n'existe pas
/// </remark>
public static void RemoveLine(string logfile, int line) {}


/// <summary>
/// Modifie la ligne <param>line</param> du fichier de log.
/// </summary>
/// <remark>
/// Lève une exception `InvalidArgumentException` si le fichier est trop court
/// ou n'existe pas
/// </remark>
public static void ModifyLine(
        string logfile,
        int line,
        LogLevel level,
        string message) {}
```

# Conclusion

Voilà, c'est la fin ! 
Félicitation à vous d'être arrivé au bout ! 

N'hésitez pas à regarder les autres sujets d'entrainement disponibles !
