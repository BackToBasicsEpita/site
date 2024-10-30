---
title: "Generics partiel S2"
date: 2023-05-15T11:30:03+00:00
weight: 13
author: "Ilan Mayeux"
description: "Entraînements Generics pour le partiel des S2 à EPITA"
---

Voici un entraînement sur les Generics pour le partiel de programmation S2

Si vous avez le moindre problème n'hésitez pas à aller sur le serveur de l'asso et poser vos questions ou à envoyer un MP à `Taliayaka | イラヌ | 生嵐#3699` sur discord

```
/*
 * Écrire une classe Element utilisant un Generic <T> ayant deux attributs public:
 * - T Content
 * - Element<T>? Next
 * Son constructeur prend un content de type T et initialize Next à null.
 */

public Element(T content);

/*
 * Écrire une classe List utilisant un Generic <T> ayant un attribut privé:
 * - Element<T>? _head
 * Son constructeur crée un nouvel _head avec l'élément donné en paramètre.
 */

public List();
public List(T element);

/*
 * Écrire une fonction Add qui ajoute le T element donné à la fin de la liste chaîné de _head.
 * Si head n'existe pas, element devient la nouvelle head de la liste;
 */

public void Add(T element);

/*
 * Écrire un indexeur qui permet d'accéder ou set le content de l'élement d'index donné.
 * Une IndexOutOfRangeException est throw si l'index est invalide
 *
 * Hint: Une fonction auxiliaire renvoyant l'élément d'index donné peut être utile.
 */

public T this[int index];

/*
 * Écrire une fonction Pop qui supprime et renvoie l'élement à l'index donné.
 * Si l'index est invalide, une InvalidIndexException est renvoyée.
 */

 public T Pop(int index = 0);
```
