import 'dart:io';
import 'dart:async';

// ===============================
// TERMINAL COLORS 
// ===============================
const reset = "\x1B[0m";
const green = "\x1B[32m";
const yellow = "\x1B[33m";
const blue = "\x1B[34m";
const cyan = "\x1B[36m";
const red = "\x1B[31m";

// ===============================
// HELPER FUNCTIONS
// ===============================
void header(String title) {
  print("\n$blue========== $title ==========$reset\n");
}

String? input(String label) {
  stdout.write("$cyan$label:$reset ");
  return stdin.readLineSync();
}

// ===============================
// PART 1: FUNCTIONS
// ===============================

// Q1
void welcomeMessage() {
  header("Q1: Welcome Message");
  print("$green Welcome to the School Management System");
  print(" Manage students, courses, and attendance$reset");
}

// Q2
void createStudent({required String name, required int age}) {
  header("Q2: Create Student (Named Parameters)");
  print("Student Name : $name");
  print("Student Age  : $age");
}

// Q3
void createTeacher(String name, {String? subject}) {
  header("Q3: Create Teacher (Optional Parameter)");
  print("Teacher Name : $name");
  print("Subject      : ${subject ?? 'Subject not assigned'}");
}

// ===============================
// PART 2 & 3: CLASSES & INHERITANCE
// ===============================

// Q6
class Person {
  String name;
  Person(this.name);

  void introduce() {
    print("Hello, my name is $name");
  }
}

// Q4, Q5, Q7, Q9, Q10, Q11, Q19
abstract class Registrable {
  void registerCourse(String courseName);
}

// Q10
mixin AttendanceMixin {
  int attendance = 0;

  void markAttendance() {
    attendance++;
    print("$green Attendance marked. Total: $attendance$reset");
  }
}

// Q19
mixin NotificationMixin {
  void notify(String message) {
    print("$yellow [NOTIFICATION] $message$reset");
  }
}

// Student class (inherits + implements + mixins)
class Student extends Person
    with AttendanceMixin, NotificationMixin
    implements Registrable {
  int age;
  List<String> courses = [];

  Student(String name, this.age) : super(name);

  @override
  void registerCourse(String courseName) {
    courses.add(courseName);
    notify("$name registered for $courseName");
  }

  void display() {
    print(
        "Name: $name | Age: $age | Attendance: $attendance | Courses: ${courses.isEmpty ? 'None' : courses.join(', ')}");
  }
}

// ===============================
// PART 6: COLLECTIONS
// ===============================

// Q12
List<Student> students = [];

// Q13
Map<String, Student> studentMap = {};

// ===============================
// PART 7: FUNCTIONS
// ===============================

// Q14
void anonymousFunctionDemo() {
  header("Q14: Anonymous Function");
  students.forEach((s) {
    print(s.name);
  });
}

// Q15
void greetStudent(String name) => print("Hello $name, welcome to the school!");

// ===============================
// PART 8: ASYNC
// ===============================

// Q16
Future<List<Student>> loadStudents() async {
  await Future.delayed(Duration(seconds: 2));
  return [
    Student("Aline", 21),
    Student("Gaetan", 22),
    Student("Alice", 20),
  ];
}

// Q17
Future<void> asyncDemo() async {
  header("Q16 & Q17: Async Loading");
  students = await loadStudents();

  studentMap.clear();
  for (int i = 0; i < students.length; i++) {
    studentMap["S00${i + 1}"] = students[i];
  }

  print("Students loaded: ${students.length}");
}

// ===============================
// PART 3 DEMOS
// ===============================

// Q6
void demoPerson() {
  header("Q6: Person Class");
  Person p = Person("Gaetan");
  p.introduce();
}

// Q7
void demoInheritance() {
  header("Q7: Inheritance Demo");
  Student s = Student("Alice", 20);
  s.introduce();
}

// ===============================
// MAIN MENU
// ===============================

Future<void> main() async {
  header("SCHOOL MANAGEMENT SYSTEM");
  print("Authors: Aline NIYONIZERA & Gaetan UWIZEYIMANA\n");

  welcomeMessage(); // Q1
  await asyncDemo(); // Q16–Q17

  while (true) {
    header("MAIN MENU");
    print("1. Create Student (Q2, Q4, Q5)");
    print("2. Create Teacher (Q3)");
    print("3. View Students Dashboard (Q11, Q12)");
    print("4. Mark Attendance (Q10, Q11)");
    print("5. Register Course (Q9, Q19)");
    print("6. Anonymous Function Demo (Q14)");
    print("7. Arrow Function Demo (Q15)");
    print("8. Person Class Demo (Q6)");
    print("9. Inheritance Demo (Q7)");
    print("10. Student Map Demo (Q13)");
    print("11. Exit");

    String? choice = input("Choose option");

    switch (choice) {
      case '1':
        String? name = input("Enter name (Aline/Gaetan/Alice)");
        String? ageStr = input("Enter age");
        if (name != null && ageStr != null) {
          int age = int.tryParse(ageStr) ?? 0;
          Student s = Student(name, age);
          students.add(s);
          studentMap["S00${studentMap.length + 1}"] = s;
          print("$green Student added successfully$reset");
        }
        break;

      case '2':
        String? tName = input("Teacher name");
        String? subject = input("Subject (optional)");
        createTeacher(tName ?? "Unknown", subject: subject);
        break;

      case '3':
        header("STUDENTS DASHBOARD");
        students.forEach((s) => s.display());
        break;

      case '4':
        String? name = input("Student name");
        var s = students.firstWhere(
            (e) => e.name.toLowerCase() == name?.toLowerCase(),
            orElse: () => Student("None", 0));
        if (s.name != "None") {
          s.markAttendance();
        } else {
          print("$red Student not found$reset");
        }
        break;

      case '5':
        String? name = input("Student name");
        String? course = input("Course name");
        var s = students.firstWhere(
            (e) => e.name.toLowerCase() == name?.toLowerCase(),
            orElse: () => Student("None", 0));
        if (s.name != "None" && course != null) {
          s.registerCourse(course);
        }
        break;

      case '6':
        anonymousFunctionDemo();
        break;

      case '7':
        header("Q15: Arrow Function");
        students.forEach((s) => greetStudent(s.name));
        break;

      case '8':
        demoPerson();
        break;

      case '9':
        demoInheritance();
        break;

  