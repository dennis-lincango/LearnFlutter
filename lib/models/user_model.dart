class UserModel{
  final int id;
  final String name;
  final String password;
  final String email;

  UserModel({required this.id, required this.name, required this.password, required this.email});

  UserModel.fromMap(Map<String, dynamic> map):
    id = map['id'],
    name = map['name'],
    password = map['password'],
    email = map['email'];

  Map<String, Object> toMap(){
    return {'id': id, 'name': name, 'password': password, 'email': email};
  }
}