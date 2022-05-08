class UserRequestParam {
  int? page;

  UserRequestParam({
    this.page,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    if (page != null) {
      map.putIfAbsent("page", () => page);
    }

    return map;
  }
}
