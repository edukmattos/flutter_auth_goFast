import 'dart:convert';

class ClientModel {
  ClientModel({
    this.id,
    this.name,
    this.einSsa,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final String id;
  final String name;
  final String einSsa;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  ClientModel copyWith({
    String id,
    String name,
    String einSsa,
    String email,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime deletedAt,
  }) =>
      ClientModel(
        id: id ?? this.id,
        name: name ?? this.name,
        einSsa: einSsa ?? this.einSsa,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory ClientModel.fromJson(String str) =>
      ClientModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClientModel.fromMap(Map<String, dynamic> json) => ClientModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        einSsa: json["ein_ssa"] == null ? null : json["ein_ssa"],
        email: json["email"] == null ? null : json["email"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "einSsa": einSsa == null ? null : einSsa,
        "email": email == null ? null : email,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
      };

  static List<ClientModel> fromJsonList(List list) {
    print(list);
    if (list == null) return null;
    //return list.map((item) => ClientModel.fromJson(item)).toList();

    return list
        .map((item) => item.cast<String, dynamic>())
        .map<ClientModel>((item) => ClientModel.fromMap(item))
        .toList();
  }
}
