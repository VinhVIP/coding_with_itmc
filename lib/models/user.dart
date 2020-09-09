class User {
  String email;
  String pass;
  String firstName;
  String lastName;
  String dateOfBirth;
  int gender;
  String studentID;
  String school;
  String gravatar;

  User();

  User.copy(this.email,
      this.pass,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.studentID,
      this.school,
      this.gravatar);

  convert(Map<String, dynamic> json) {
    firstName = json['firstName'] ?? null;
    lastName = json['lastName'] ?? null;
    dateOfBirth = json['dateOfBirth'] ?? null;
    String s_gender = json['gender'] ?? null;
    studentID = json['studentID'] ?? null;
    school = json['school'] ?? null;
    gravatar = json['gravatar'] ?? null;

    if (s_gender != null) {
      if (s_gender.toLowerCase().compareTo("male") == 0)
        gender = 0;
      else if (s_gender.toLowerCase().compareTo("female") == 0)
        gender = 1;
      else
        gender = 2;
    }

    if (dateOfBirth != null) {
      dateOfBirth = dateOfBirth.substring(0, 10);
      List<String> s = dateOfBirth.split("-");
      dateOfBirth = s[2] + "/" + s[1] + "/" + s[0];
    }
  }
}

class UserLogin {
  bool isLogged;
  String email;
  String pass;

  UserLogin(this.isLogged, this.email, this.pass);
}

class UserStore {
  String email;
  String pass;

  UserStore(this.email, this.pass);
}
