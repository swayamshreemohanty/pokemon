class Ability {
  final String name;
  final String text;
  final String type;

  Ability({required this.name, required this.text, required this.type});

  // from map
  factory Ability.fromMap(Map<String, dynamic> map) {
    return Ability(
      name: map['name'],
      text: map['text'],
      type: map['type'],
    );
  }
}

class Attack {
  final String name;
  final List<String> cost;
  final int convertedEnergyCost;
  final String damage;
  final String text;

  Attack({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });

  // from map
  factory Attack.fromMap(Map<String, dynamic> map) {
    return Attack(
      name: map['name'],
      cost: List<String>.from(map['cost']),
      convertedEnergyCost: map['convertedEnergyCost'],
      damage: map['damage'],
      text: map['text'],
    );
  }
}

class Weakness {
  final String type;
  final String value;

  Weakness({required this.type, required this.value});

  // from map
  factory Weakness.fromMap(Map<String, dynamic> map) {
    return Weakness(
      type: map['type'],
      value: map['value'],
    );
  }
}

class Resistance {
  final String type;
  final String value;

  Resistance({required this.type, required this.value});

  // from map
  factory Resistance.fromMap(Map<String, dynamic> map) {
    return Resistance(
      type: map['type'],
      value: map['value'],
    );
  }
}

class ImagesModel {
  final String? symbol;
  final String? logo;
  final String? small;
  final String? large;

  ImagesModel({
    required this.symbol,
    required this.logo,
    required this.small,
    required this.large,
  });

  // from map
  factory ImagesModel.fromMap(Map<String, dynamic> map) {
    return ImagesModel(
      symbol: map['symbol'],
      logo: map['logo'],
      small: map['small'],
      large: map['large'],
    );
  }
}

class Legalities {
  final String unlimited;
  final String? expanded;

  Legalities({
    required this.unlimited,
    required this.expanded,
  });

  // from map
  factory Legalities.fromMap(Map<String, dynamic> map) {
    return Legalities(
      unlimited: map['unlimited'],
      expanded: map['expanded'],
    );
  }
}
