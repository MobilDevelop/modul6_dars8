class User {
  String name;
  String salary;
  String age;

  User(this.name, this.salary, this.age);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        salary = json['salary'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'salary': salary,
    'age': age,
  };
}