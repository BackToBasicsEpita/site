---
title: "Classes, Héritage et Interfaces"
date: 2023-06-18T00:00:00+02:00
author: "Ilan Mayeux"
description: "Un court TP pour pratiquer les classes, l'héritage et les interfaces pour les rattrapages S1"
---

Bienvenue sur cet entraînement pour les rattrapages S1 sur les classes, l'héritage et les interfaces.

Si vous avez le moindre problème n'hésitez pas à aller sur le serveur de l'asso et poser vos questions ou à envoyer un MP à `taliayaka` sur discord

Avant de commencer, prenez le temps de relire la documentation sur :
- [Les classes](https://docs.microsoft.com/fr-fr/dotnet/csharp/programming-guide/classes-and-structs/classes)
- [L'héritage](https://docs.microsoft.com/fr-fr/dotnet/csharp/programming-guide/classes-and-structs/inheritance)
- [Les interfaces](https://docs.microsoft.com/fr-fr/dotnet/csharp/programming-guide/interfaces/)

Pour ce TP, vous aurez besoin de créer un nouveau projet console. Pour cela, ouvrez Visual Studio ou Rider et cliquez sur `Créer un nouveau projet`. Sélectionnez `Application console (.NET Core)` et cliquez sur `Suivant`. Nommez votre projet `ClassesInheritanceInterfaces` et cliquez sur `Créer`.

### Partie 1 : Les classes et l'héritage

#### Shape.cs

```csharp
/// <summary>
/// Écrire une classe abstraite Shape qui contient une méthode publique virtuelle CalculateArea() qui retourne un double 0.
/// </summary>
public abstract class Shape {}
public virtual double CalculateArea();
```
#### Circle.cs

```csharp
/// <summary>
/// Écrire une classe Circle qui hérite de Shape et qui contient une propriété publique de type double appelée "Radius".
/// </summary>
public class Circle {}
```
```csharp
/// <summary>
/// Écrire un constructeur qui prend un double radius et qui initialise Radius à radius.
/// </summary>
public Circle(double radius);
```
```csharp
/// <summary>
/// Écrire une méthode CalculateArea() qui retourne l'aire du cercle.
/// L'aire d'un cercle est calculée en faisant radius * radius * Math.PI
/// </summary>
public override double CalculateArea();
```
```csharp
/// <summary>
/// Écrire une méthode ToString() qui retourne une string de la forme "Circle with radius {Radius}"
/// </summary>
public override string ToString();
```
```csharp
/// <summary>
///  Écrire une méthode statique CreateRandom qui prend un int maxRadius et qui retourne un nouveau cercle avec un rayon aléatoire entre 0 et maxRadius.
/// Si maxRadius est négatif, une exception `ArgumentOutOfRangeException` est levée.
/// Sa surcharge sans paramètre doit créer un cercle avec un rayon aléatoire entre 1 et 100.
/// </summary>
/// <remarks>
/// Pour générer un nombre aléatoire, vous pouvez utiliser Random.Next.
/// </remarks>
public static Circle CreateRandom(int maxRadius);
public static Circle CreateRandom();
```

#### Rectangle.cs

```csharp
/// <summary>
/// Écrire une classe Rectangle qui hérite de Shape et qui contient deux propriétés publiques : double Width et double Height.
/// </summary>
public class Rectangle {}
```
```csharp
/// <summary>
/// Écrire un constructeur qui prend un double width et un double height et qui initialise Width à width et Height à height.
/// </summary>
public Rectangle(double width, double height);
```
```csharp
/// <summary>
/// Écrire une méthode override CalculateArea() qui retourne l'aire du rectangle.
/// L'aire d'un rectangle est calculée en faisant width * height
/// </summary>
public override double CalculateArea();
```
```csharp
/// <summary>
/// Écrire une méthode override ToString() qui retourne une string de la forme "Rectangle with width {Width} and height {Height}"
/// </summary>
public override string ToString();
```
```csharp
/// <summary>
///  Écrire une méthode statique CreateRandom qui prend deux doubles (maxWidth et maxHeight) et qui retourne un nouveau rectangle avec une largeur entre 1 et maxWidth et une hauteur aléatoire entre 1 et maxHeight.
/// Si maxWidth ou maxHeight est négatif, une exception `ArgumentOutOfRangeException` est levée.
/// Sa surcharge sans paramètre doit créer un rectangle avec une largeur et une hauteur aléatoire entre 1 et 100.
/// </summary>
/// <remarks>
/// Pour générer un nombre aléatoire, vous pouvez utiliser Random.Next.
/// </remarks>
public static Rectangle CreateRandom(double maxWidth, double maxHeight);
public static Rectangle CreateRandom();
```

#### Square.cs

```csharp
/// <summary>
/// Écrire une classe Square qui hérite de Rectangle.
/// </summary>
public class Square {}
```
```csharp
/// <summary>
/// Écrire un constructeur qui prend un double side et qui initialise Width et Height à side.
/// </summary>
/// <remarks>
/// Le corps de ce constructeur doit être vide.
/// </remarks>
public Square(double side);
```
```csharp
/// <summary>
/// Écrire une méthode override ToString() qui retourne une string de la forme "Square with side {Width}"
/// </summary>
public override string ToString();
```
```csharp
/// <summary>
///  Écrire une méthode statique CreateRandom qui prend un double maxSide et qui retourne un nouveau carré avec un côté aléatoire entre 1 et maxSide.
/// Si maxSide est négatif, une exception `ArgumentOutOfRangeException` est levée.
/// Son override sans paramètre doit créer un carré avec un côté aléatoire entre 1 et 100.
/// </summary>
/// <remarks>
/// Pour générer un nombre aléatoire, vous pouvez utiliser Random.Next.
/// </remarks>
public static Square CreateRandom(double maxSide);
public new static Square CreateRandom();
```

#### Shape.cs

```csharp
/// <summary>
/// Écrire une méthode statique CreateRandom qui prend un int nbSquare, un int nbRectangle et un int nbCircle et qui retourne un tableau de Shape de longueur (nbSquare + nbRectangle + nbCircle). 
/// Le tableau doit contenir nbSquare carrés, nbRectangle rectangles et nbCircle cercles généré aléatoirement.
/// Si nbSquare, nbRectangle ou nbCircle est négatif, une ArgumentOutOfRangeException est levée.
/// </summary>
/// <remarks>
/// Vous pouvez utiliser les méthodes CreateRandom de Circle, Rectangle et Square.
/// </remarks>
public static Shape[] CreateRandom(int nbSquare, int nbRectangle, int nbCircle);
```

### Partie 2 : Les interfaces

#### IDrawable.cs

```csharp
/// <summary>
/// Écrire une interface IDrawable qui contient une méthode public void Draw().
/// </summary>
public interface IDrawable {}
```
```csharp
/// <summary>
/// Écrire une méthode statique DrawAll qui prend un tableau de IDrawable et qui appelle la méthode Draw() de chaque élément du tableau.
/// </summary>
public static void DrawAll(IDrawable[] drawables);
```

#### Rectangle.cs

```csharp
/// <summary>
/// Faire hériter Rectangle de IDrawable.
/// </summary>
public class Rectangle {}
```
```csharp
/// <summary>
/// Écrire une méthode override Draw() qui affiche
/// ----------------
/// |              |
/// |              |
/// ----------------
/// </summary>
public override void Draw();
```

#### Square.cs

```csharp
/// <summary>
/// Override la méthode Draw() de Square pour qu'elle affiche
/// -------
/// |     |
/// |     |
/// -------
/// </summary>
public override void Draw();
```

#### Circle.cs

```csharp
/// <summary>
/// Faire hériter Circle de IDrawable.
/// </summary>
public class Circle {}
```
```csharp
/// <summary>
/// Écrire une méthode override Draw() qui affiche
///   ________
///  /        \
/// |          |
///  \________/
/// </summary>
public override void Draw();
```

#### Line.cs

```csharp
/// <summary>
/// Écrire une classe Line qui implémente IDrawable.
/// </summary>
public class Line {}
```
```csharp
/// <summary>
/// Écrire un constructeur qui prend deux int x et y et qui initialise X à x et Y à y.
/// </summary>
public Line();
```
```csharp
/// <summary>
/// Écrire une méthode override Draw() qui affiche une ligne.
/// </summary>
public override void Draw();
```




