import 'dart:convert';

class Weight {
  final DateTime time;
  final int weight;

  Weight({
    required this.time,
    required this.weight,
  });

  Weight copyWith({
    DateTime? time,
    int? weight,
  }) {
    return Weight(
      time: time ?? this.time,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.millisecondsSinceEpoch,
      'weight': weight,
    };
  }

  factory Weight.fromMap(Map<String, dynamic> map) {
    return Weight(
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      weight: map['weight'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weight.fromJson(String source) =>
      Weight.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Weight(time: $time, weight: $weight)';

  @override
  bool operator ==(covariant Weight other) {
    if (identical(this, other)) return true;

    return other.time == time && other.weight == weight;
  }

  @override
  int get hashCode => time.hashCode ^ weight.hashCode;
}

List<Weight> weights = [
  Weight(time: DateTime.now(), weight: 70),
  Weight(time: DateTime.now(), weight: 67),
  Weight(time: DateTime.now(), weight: 65)
];
