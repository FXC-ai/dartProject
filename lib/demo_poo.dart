
class ClConstructDefault
{
  late String _nom;

  String get nom => _nom;

  set nom(String new_nom)
  {
    this._nom = new_nom;
  }

  ClConstructDefault()
  {
    this._nom = "no name";
  }

}

class ClConstructParam
{
  late String _nom;

  String get nom => _nom;

  set nom(String new_nom)
  {
    this._nom = new_nom;
  }

  ClConstructParam(nom)
  {
    this._nom = nom;
  }

  void deleteNom ()
  {
    this.nom = "no name";
  }

  ClConstructParam.byDefault () : this("no name");
}

class ClConstructNamed
{
  late String nom;

  ClConstructNamed({required this.nom});
}

class ClConstructConst
{
  final String nom;

  const ClConstructConst({required this.nom});

  static void displayStr (String msg)
  {
    print("msg = $msg");
  }
}

abstract class Day {
  void Iam();
}

class Lundi extends Day
{
  @override
  void Iam()
  {
    print("Je suis un lundi");
  }
}

class Voiture
{
  late String energie;

  Voiture(this.energie);

  void quelleEnergie()
  {
    print("Je roule avec ${this.energie}");
  }

}

class C3 extends Voiture
{
  C3(String energie) : super(energie);

}

class ClGeneric<A, B>
{
  late A valueA;
  late B valueB;

  ClGeneric (this.valueA, this.valueB);
}

enum jour {
  lundi,
  mardi,
  mercredi,
  jeudi,
  vendredi,
  samedi,
  dimanche
}



