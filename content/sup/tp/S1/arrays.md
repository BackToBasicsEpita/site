---
title: "Tableaux"
date: 2023-06-18T00:00:00+02:00
author: "Kolowy"
description: "Entrainements sur les tableaux de tableaux en C#"
---
# Introduction

Ce TP est un sujet d'entrainement pour les tableaux de tableaux en C#.

Si vous avez le mondre probleme n'hésitez pas à aller sur le serveur de l'asso et poser vos questions ou à envoyer un MP à `kolowy_` sur discord

# Code à compléter

```

/// <summary>
/// Calcule la somme de deux tableaux de tableaux d'entiers.
/// </summary>
/// <param name="arrays1">Le premier tableau de tableaux.</param>
/// <param name="arrays2">Le deuxième tableau de tableaux.</param>
/// <returns>Le tableau de tableaux contenant la somme des éléments correspondants.</returns>
/// Il y a une exceptions a gérer dans cette fonction :
/// - Les tableaux de tableaux doivent avoir la même taille
static int[][] SumOfTwoArraysOfArrays(int[][] arrays1, int[][] arrays2)
{
    // TODO
    throw new NotImplementedException();
}

/// <summary>
/// Affiche les éléments d'un tableau de tableaux.
/// </summary>
/// <param name="array">Le tableau de tableaux à afficher.</param>
static void DisplayArrays(int[][] array)
{
    // TODO
    throw new NotImplementedException();
}

static void Main()
{
    int[][] arrays1 = new int[][]
    {
        new int[] { 1, 2, 3 },
        new int[] { 4, 5, 6 },
        new int[] { 7, 8, 9 }
    };

    int[][] arrays2 = new int[][]
    {
        new int[] { 10, 11, 12 },
        new int[] { 13, 14, 15 },
        new int[] { 16, 17, 18 }
    };

    int[][] sumArrays = SumOfTwoArraysOfArrays(arrays1, arrays2);

    Console.WriteLine("Tableaux 1 :");
    DisplayArrays(arrays1);

    Console.WriteLine("Tableaux 2 :");
    DisplayArrays(arrays2);

    Console.WriteLine("Somme des tableaux :");
    DisplayArrays(sumArrays);
}

Main();
```


Résultat attendu : 
```
Tableaux 1 :
1 2 3
4 5 6
7 8 9
Tableaux 2 :
10 11 12
13 14 15
16 17 18
Somme des tableaux :
11 13 15
17 19 21
23 25 27
```
