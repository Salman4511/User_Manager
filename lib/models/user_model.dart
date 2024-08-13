class UserModel {
  String name;
  int age;
  String imageUrl;

  UserModel({required this.name, required this.age, required this.imageUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      age: json['age'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'imageUrl': imageUrl,
    };
  }
}
