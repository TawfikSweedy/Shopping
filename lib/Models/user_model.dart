
import 'package:equatable/equatable.dart';
import 'job_model.dart';

class UserModel extends Equatable {
  final String? id;
  String? token;
  final String? name;
  final String? email;
  final String? phone;
  String? jobType;
  final int? gender;
  final String? image;
  final int? jobId;
  final DateTime? dob;
  final DateTime? employmentDate;
  final int? achievements;
  final int? points;
  final dynamic emailVerifiedAt;
  final dynamic firstLoginToken;
  final int? isActive;
  final int? numOfDelete;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final JobModel? job;
  final bool? isManager;
  final bool? isUser;
  bool isSelect;

  UserModel( {
    this.id,
    this.token,
    this.name,
    this.isSelect = false,
    this.email,
    this.phone,
    this.gender,
    this.image,
    this.jobId,
    this.dob,
    this.jobType,
    this.employmentDate,
    this.achievements,
    this.points,
    this.emailVerifiedAt,
    this.firstLoginToken,
    this.isActive,
    this.numOfDelete,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.job,
    this.isManager,
    this.isUser
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"].toString(),
    token: json["token"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    jobType: json["job_type"],
    isSelect: json["isSelect"]??false,
    // gender: json["gender"],
    image: json["image"],
    job: json["job"] == null ? null : JobModel.fromJson(json["job"]),
    jobId: json["job_id"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    employmentDate: json["employment_date"] == null ? null : DateTime.parse(json["employment_date"]),
    achievements: json["achievements"],
    points: json["points"],
    emailVerifiedAt: json["email_verified_at"],
    firstLoginToken: json["first_login_token"],
    isActive: json["is_active"],
    numOfDelete: json["num_of_delete"],
    deletedAt: json["deleted_at"],
    isManager: json["is_manager"],
    isUser: json["is_user"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
    "name": name,
    "email": email,
    "phone": phone,
    "gender": gender,
    "image": image,
    "is_manager": isManager,
    "is_user": isUser,
    "job": job?.toJson(),
    "job_id": jobId,
    "job_type": jobType,
    "dob": dob?.toIso8601String(),
    "employment_date": employmentDate?.toIso8601String(),
    "achievements": achievements,
    "points": points,
    "email_verified_at": emailVerifiedAt,
    "first_login_token": firstLoginToken,
    "is_active": isActive,
    "num_of_delete": numOfDelete,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
  Map<String, String> toUpdateProfile() {

    Map<String, String> body = {
      "name": name ?? '',
      "email": email ?? '',
      "phone": phone ?? '',
      "_method":"patch"
    };
    return body;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
