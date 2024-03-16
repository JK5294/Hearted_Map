class Response {
  int code;
  Student? data;
  String msg;

  Response({
    required this.code,
    required this.data,
    required this.msg,
  });
}

///Student
class Student {
  dynamic birthday;
  String college;
  String collegeIdNumber;
  String educationForm;
  int educationLength;
  String educationType;
  dynamic enterDate;
  String faculty;
  int facultyClass;
  String level;
  String major;
  String name;
  String nationality;
  String registerStatus;
  int sex;
  String socialIdNumber;
  int userId;

  Student({
    required this.birthday,
    required this.college,
    required this.collegeIdNumber,
    required this.educationForm,
    required this.educationLength,
    required this.educationType,
    required this.enterDate,
    required this.faculty,
    required this.facultyClass,
    required this.level,
    required this.major,
    required this.name,
    required this.nationality,
    required this.registerStatus,
    required this.sex,
    required this.socialIdNumber,
    required this.userId,
  });
}
