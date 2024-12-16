
class JobModel {
  final int? id;
  final String? name;
  final int? departmentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? isManagerial;

  JobModel({
    this.id,
    this.name,
    this.departmentId,
    this.createdAt,
    this.updatedAt,
    this.isManagerial,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    id: json["id"],
    name: json["name"],
    departmentId: json["department_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isManagerial: json["is_managerial"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "department_id": departmentId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "is_managerial": isManagerial,
  };
}