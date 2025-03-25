class CreateUserReq {
  String name;
  String email;
  String password;

  CreateUserReq({
    required this.name,
    required this.email,
    required this.password,
  });
}