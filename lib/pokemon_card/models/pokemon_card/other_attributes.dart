/// Represents an ability of a Pokémon card.
class Ability {
  /// The name of the ability.
  final String name;

  /// The description text of the ability.
  final String text;

  /// The type of the ability.
  final String type;

  /// Creates an instance of [Ability].
  Ability({required this.name, required this.text, required this.type});

  /// Creates an instance of [Ability] from a map.
  ///
  /// [map] is a map containing the ability data.
  factory Ability.fromMap(Map<String, dynamic> map) {
    return Ability(
      name: map['name'],
      text: map['text'],
      type: map['type'],
    );
  }
}

/// Represents an attack of a Pokémon card.
class Attack {
  /// The name of the attack.
  final String name;

  /// The energy cost of the attack.
  final List<String> cost;

  /// The converted energy cost of the attack.
  final int convertedEnergyCost;

  /// The damage of the attack.
  final String damage;

  /// The description text of the attack.
  final String text;

  /// Creates an instance of [Attack].
  Attack({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });

  /// Creates an instance of [Attack] from a map.
  ///
  /// [map] is a map containing the attack data.
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

/// Represents a weakness of a Pokémon card.
class Weakness {
  /// The type of the weakness.
  final String type;

  /// The value of the weakness.
  final String value;

  /// Creates an instance of [Weakness].
  ///
  /// [type] is the type of the weakness.
  /// [value] is the value of the weakness.
  Weakness({required this.type, required this.value});

  /// Creates an instance of [Weakness] from a map.
  ///
  /// [map] is a map containing the weakness data.
  factory Weakness.fromMap(Map<String, dynamic> map) {
    return Weakness(
      type: map['type'],
      value: map['value'],
    );
  }
}

/// Represents a resistance of a Pokémon card.
class Resistance {
  /// The type of the resistance.
  final String type;

  /// The value of the resistance.
  final String value;

  /// Creates an instance of [Resistance].
  ///
  /// [type] is the type of the resistance.
  /// [value] is the value of the resistance.
  Resistance({required this.type, required this.value});

  /// Creates an instance of [Resistance] from a map.
  ///
  /// [map] is a map containing the resistance data.
  factory Resistance.fromMap(Map<String, dynamic> map) {
    return Resistance(
      type: map['type'],
      value: map['value'],
    );
  }
}

/// Represents the legalities of a Pokémon card.
class Legalities {
  /// The unlimited legality status.
  final String unlimited;

  /// The expanded legality status.
  final String? expanded;

  /// Creates an instance of [Legalities].
  ///
  /// [unlimited] is the unlimited legality status.
  /// [expanded] is the expanded legality status.
  Legalities({
    required this.unlimited,
    required this.expanded,
  });

  /// Creates an instance of [Legalities] from a map.
  ///
  /// [map] is a map containing the legalities data.
  factory Legalities.fromMap(Map<String, dynamic> map) {
    return Legalities(
      unlimited: map['unlimited'],
      expanded: map['expanded'],
    );
  }
}
