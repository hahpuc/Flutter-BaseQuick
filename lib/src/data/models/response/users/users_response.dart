class UsersResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserModel>? data;

  UsersResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  UsersResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];

    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['page'] = page;
    data['per_page'] = perPage;
    data['total'] = total;
    data['total_pages'] = totalPages;

    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class UserModel {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}
