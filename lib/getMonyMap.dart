class Money {
  int amount = 0;
  Map<String, int> moneymap = {
    "500": 0,
    "200": 0,
    "100": 0,
    "50": 0,
    "25": 0,
    "10": 0,
  };
  Money(int x) {
    amount = x;
    this.getMonyMap(x);
  }
  zeros() {
    moneymap = {"500": 0, "200": 0, "100": 0, "50": 0, "25": 0, "10": 0};
  }

  getMonyMap(int amount) {
    if (amount < 35) return;
    if (amount % 10 != 5 || amount % 100 == 25) {
      moneymap["500"] = (amount / 500).floor();
      amount = amount % 500;
      moneymap["200"] = (amount / 200).floor();
      amount = amount % 200;
      moneymap["100"] = (amount / 100).floor();
      amount = amount % 100;
      moneymap["50"] = (amount / 50).floor();
      amount = amount % 50;
      /*
      moneymap["25"] = (amount / 25).floor();
      amount = amount % 25;
      */
      moneymap["10"] = (amount / 10).floor();
      amount = amount % 10;
    } else {
      amount = amount - 35;
      moneymap["500"] = (amount / 500).floor();
      amount = amount % 500;
      moneymap["200"] = (amount / 200).floor();
      amount = amount % 200;
      moneymap["100"] = (amount / 100).floor();
      amount = amount % 100;
      moneymap["50"] = (amount / 50).floor();
      amount = amount % 50;
      moneymap["25"] = 1;
      moneymap["10"] = (amount / 10).floor() + 1;
      amount = amount % 10;
    }
    ;
  }

  // if you dont have some kind use this function to convert the kind that you dont have to another one
  convert(int kind) {
    if (kind == 500) {
      moneymap["200"] = moneymap["200"]! + (2 * moneymap["500"]!);
      moneymap["100"] = moneymap["100"]! + moneymap["500"]!;
      moneymap["500"] = 0;
    }
    if (kind == 200) {
      moneymap["100"] = moneymap["100"]! + (2 * moneymap["200"]!);
      moneymap["200"] = 0;
    }
    if (kind == 100) {
      moneymap["50"] = moneymap["50"]! + (2 * moneymap["100"]!);
      moneymap["100"] = 0;
    }
    if (kind == 50) {
      moneymap["25"] = moneymap["25"]! + (2 * moneymap["50"]!);
      moneymap["50"] = 0;
    }

    if (kind == 25 && moneymap["25"]! % 2 == 0) {
      double b = (moneymap["25"]! / 2);
      for (int i = 0; i < b; i++) {
        moneymap["10"] = moneymap["10"]! + 5;
      }
      moneymap["25"] = 0;
    }
  }
}
/*
void main() {
  double x=4752;
  Money a = Money(x);
  Map<String, int> result = a.moneymap;
  print(result);
  a.convert(500);
  a.convert(200);
  a.convert(100);
  a.convert(50);
  a.convert(25);
  print(a.moneymap);
}
*/