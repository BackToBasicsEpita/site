---
title: "Stream"
date: 2023-10-31T10:56:56+01:00
author: "Lenny"
description: "Entraînements sur la manipulation de fichiers en C#"
---

# Introduction

Ce TP est un sujet d'entraînement pour à l'utilisation de streams et de la manipulations de fichiers en C#.

Si vous avez la moindre question, n'hésitez pas à poser vos questions sur le [serveur Discord](https://discord.gg/SJGWzkU2gd) de BackToBasics ! :D

Les streams nous permettent de lire et écrire dans un fichier. On parle alors de manipulation de fichiers.

# Stream.cs

Afin de pouvoir utiliser les fonctions pour manipuler des fichiers, n'oubliez pas de rajouter le `using` suivant :

```csharp
using System.IO;
```

## Existfile
```csharp
/// <summary>
/// Fonction qui vérifie si le fichier associé à `path` existe.
/// </summary>
public static bool ExistFile(string path)

```

## MyReplace

```csharp

/// <summary>
/// Remplace chaque itération du caracètre `char`  dans le fichier `path` par le caractère `replace`.
/// Elle devra modifier le fichier inscrit dans `path` et le créer si celui-ci n'existe pas.
/// </summary>
/// <remarks>
    /// Le fichier modifié devra se finir par un retour à la ligne.
    /// Si une erreur apparaît, renvoyer une ArgumentException avec comme message "Error".
/// </remarks>
public static void MyReplace(string path, char toReplace, char replace)

```
Prenons le fichier : *test*
```
Bonjour,
Ceci est un message de test.
J'espere que vous allez reussir vos exams :D.
```

```csharp
MyReplace(path, 'e', 'f'); // path est le chemin de mon fichier
```
On aura alors le fichier *test* suivant:
```
Bonjour,
Cfci fst un message de tfst.
J'fspfrf quf vous allfz rfussir vos fxams :D.

```

## DeleteLines

```csharp

/// <summary>
/// Supprime toutes les lignes multiples de la variable `n` dans le fichier `path`.
/// Elle devra modifier le fichier et le créer si celui-ci n'existe pas.
/// </summary>
/// <remarks>
    /// Le fichier modifié devra se finir par un retour a la ligne
    /// Si le fichier n'existe pas alors renvoyer une ArgumentException avec comme message "Error"
/// </remarks>
public static void DeleteLines(string path, int n)

```

Prenons le fichier : *ToDelete*
```
0
1
2
3
4
5
6
7
8
9
10
11
12
```

```csharp
public static void DeleteLines(path, 2); // path est le chemin de mon fichier
```
On aura alors le fichier *ToDelete* suivant:

```
1
3
5
7
9
11

```

