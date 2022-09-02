import 'dart:convert';

class Owner {
  final int id;
  Owner({
    required this.id,
  });

  Owner copyWith({
    int? id,
  }) {
    return Owner(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
  
    return result;
  }

  factory Owner.fromMap(Map<String, dynamic> map) {
    return Owner(
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Owner.fromJson(String source) => Owner.fromMap(json.decode(source));

  @override
  String toString() => 'Owner(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Owner &&
      other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}