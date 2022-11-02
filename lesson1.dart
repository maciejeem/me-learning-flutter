import 'dart:core';

/* 
    1. Uruchom program. Spróbuj przerobić wszystkie typy inferencyjne (var) na typy właściwe (String, int, itd.)
    2. Michał nie ma psa. W konstruktorze obiektu Person podaj null do parametru dogName a następnie spróbuj uruchomić program. 
    3. Zmodyfikuj typ zmiennej dogName na nullowalny tak aby program działał poprawnie. W sytuacji gdy wykorzystujemy zmienna dogName, załozmy ze jest ona pustym stringiem ?? ''
    4. Zmien funkcje getLastTwo i getFirstTwo tak aby parametr string które przyjmują mogł być nullem.Zwróć pusty string gdy length jest nullem. Popraw wywałoania length z wykorzystaniem (!.) i (?.)
    5. Metoda generateUsername jest jednolnikowa, spróbuj przerobić wywołanie na tzw expression body 
    6. Zmień konstruktor klasy Person tak aby domyślna wartość dogName była pustym stringiem jeśli dogName nie zostanie podane podczas inicjalizacji. W efekcie zmianna dogName powinna przestać być nullowalna
    *7. yearBorn korzysta z klasy DateTime. Spróbuj rozszerzyć klaske DateTime tak aby ponizszy kod dzialal poprawnie
     int yearBorn = DateTime.now().subtractYears(age); 

  */

void main() {
  String name = 'Maciej';
  int age = 25;
  int yearBorn = DateTime.now().subtractYears(age).year;
  Person person = Person(name, yearBorn.toString());

  print('$name new username: ${person.generateUsername()}');
}

class Person {
  Person(this.name, this.yearBorn, [this.dogName = ""]);
  final String name;
  final String yearBorn;
  final String dogName;

  String generateUsername() =>
      getFirstTwo(name) + getLastTwo(dogName) + getLastTwo(yearBorn);
}

String getLastTwo(String? string) {
  if (string == null) {
    return "";
  }
  var length = string.length;
  if (length < 2) return '';
  return string.substring(string.length - 2);
}

String getFirstTwo(String? string) {
  if (string == null) {
    return "";
  }
  var length = string.length;
  if (length < 2) return '';
  return string.substring(0, 2);
}

extension CalculatingDates on DateTime {
  DateTime subtractYears(int years) {
    return DateTime(this.year - years, this.month, this.day);
  }
}
