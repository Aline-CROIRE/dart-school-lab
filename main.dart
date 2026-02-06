import 'dart:io';
import 'dart:async';

// ====================
// Colors for terminal text
// ====================
const reset = "\x1B[0m";
const red = "\x1B[31m";
const green = "\x1B[32m";
const yellow = "\x1B[33m";
const blue = "\x1B[34m";
const magenta = "\x1B[35m";
const cyan = "\x1B[36m";
const white = "\x1B[37m";

// ====================
// Helper Functions
// ====================
void printHeader(String text) {
  print("\n${blue}================== $text ==================${reset}\n");
}

void printNotification(String message) {
  print("${yellow}📢 $message${reset}");
}

String? input(String prompt) {
  stdout.write("${cyan}$prompt$reset: ");
  return stdin.readLineSync();
}

// ====================
// Part 1: Functions
// ====================

void welcomeMessage() {
  printHeader("Q1: Welcome Message");
  print("${green}Welcome to the School Management System!${reset}");
  print("${yellow}Manage students, teachers, attendance, and courses easily.${reset}\n");
}

void createStudent({required String name, required int age}) {
  printHeader("Q2: Create Student");
  print("${blue}Student Details:$reset");
  print("Name: $name");
  print("Age : $age\n");
}

void createTeacher(String name, {String? subject}) {
  printHeader("Q3: Create Teacher");
  print("${magenta}Teacher Details:$reset");
  print("Name   : $name");
  print("Subject: ${subject ?? 'Subject not assigned'}\n");
}

// ====================
// Part 2: Classes & Constructors
// ====================

class Student {
  String name;
  int age;
  Student(this.name, this.age);
  void display() => print("Name: $name | Age: $age");
}

// ====================
// Part 3: Inheritance
// ====================

class Person {
  String name;
  Person(this.name);
  void introduce() => print("Hello, my name is $name.");
}

class StudentPerson extends Person {
  int age;
  StudentPerson(String name, this.age) : super(name);
}

// ====================
// Part 4: Interfaces
// ====================

abstract class Registrable {
  void registerCourse(String courseName);
}

class StudentRegistrable implements Registrable {
  String name;
  StudentRegistrable(this.name);

  @override
  void registerCourse(String courseName) {
    print("${green}$name registered for $courseName${reset}");
  }
}

// ====================
// Part 5: Mixins
// ====================

mixin AttendanceMixin {
  int attendance = 0;
  void markAttendance() {
    attendance++;
    print("${green}✔ Attendance marked. Total: $attendance${reset}");
  }
}

mixin NotificationMixin {
  void notifyRegistration(String studentName, String course) {
    printNotification("$studentName registered for $course");
  }
}

class StudentAttendance extends Student with AttendanceMixin, NotificationMixin {
  List<String> courses = [];
  StudentAttendance(String name, int age) : super(name, age);

  void registerCourse(String course) {
    courses.add(course);
    notifyRegistration(name, course);
  }

  void displayFull() {
    print("${cyan}Name: $name | Age: $age | Attendance: $attendance | Courses: ${courses.join(', ')}${reset}");
  }
}

// ====================
// Part 6-8 Collections, Anonymous, Arrow, Async
// ====================

List<StudentAttendance> students = [];

void anonymousDemo() {
  printHeader("Q14: Anonymous Function Demo");
  students.forEach((s) => print(s.name));
}

void arrowDemo() {
  printHeader("Q15: Arrow Function Demo");
  void greet(String name) => print("👋 Hello $name! Welcome!");
  students.forEach((s) => greet(s.name));
}

Future<List<StudentAttendance>> loadStudents() async {
  await Future.delayed(Duration(seconds: 2));
  var aline = StudentAttendance("Aline", 21);
  aline.courses.addAll(["Mathematics", "Physics"]);

  var gaetan = StudentAttendance("Gaetan", 22);
  gaetan.courses.addAll(["Computer Science", "Mathematics"]);

  var alice = StudentAttendance("Alice", 20);
  alice.courses.addAll(["Biology", "Chemistry"]);

  return [aline, gaetan, alice];
}

Future<void> asyncDemo() async {
  printHeader("Q16-Q17: Async Demo");
  List<StudentAttendance> loaded = await loadStudents();
  students = loaded;
  print("Number of students loaded: ${loaded.length}\n");
}

// ====================
// MAIN MENU
// ====================

Future<void> main() async {
  printHeader("SCHOOL MANAGEMENT SYSTEM");
  print("${magenta}Authors: Aline NIYONIZERA & Gaetan UWIZEYIMANA${reset}\n");

  welcomeMessage(); // Q1
  await asyncDemo(); // preload students

  while (true) {
    printHeader("MAIN MENU");
    print("1. Create Student (Q2, Q4-Q5)");
    print("2. Create Teacher (Q3)");
    print("3. View Students Dashboard (Q11-Q13)");
    print("4. Mark Attendance (Q10-Q11)");
    print("5. Register Course (Q9, Q19)");
    print("6. Show Anonymous Names (Q14)");
    print("7. Show Greetings (Q15)");
    print("8. Exit");

    String? choice = input("Enter your choice");
    if (choice == null) continue;

    switch (choice) {
      case '1':
        String? name = input("Enter student name (Aline, Gaetan, Alice)");
        String? ageStr = input("Enter age");
        if (name != null && ageStr != null) {
          int age = int.tryParse(ageStr) ?? 0;
          students.add(StudentAttendance(name, age));
          printNotification("$name added to the system");
        }
        break;

      case '2':
        String? name = input("Enter teacher name");
        String? subject = input("Enter subject (optional)");
        createTeacher(name ?? "Unknown", subject: subject);
        break;

      case '3':
        printHeader("STUDENT DASHBOARD");
        if (students.isEmpty) print("No students found.");
        else students.forEach((s) => s.displayFull());
        break;

      case '4':
        String? name = input("Enter student name to mark attendance");
        var student = students.firstWhere(
            (s) => s.name.toLowerCase() == name?.toLowerCase(),
            orElse: () => StudentAttendance("Unknown", 0));
        if (student.name != "Unknown") student.markAttendance();
        else print("${red}Student not found!${reset}");
        break;

      case '5':
        String? name = input("Enter student name to register course");
        String? course = input("Enter course name");
        if (name != null && course != null) {
          var student = students.firstWhere(
              (s) => s.name.toLowerCase() == name.toLowerCase(),
              orElse: () => StudentAttendance("Unknown", 0));
          if (student.name != "Unknown") student.registerCourse(course);
          else print("${red}Student not found!${reset}");
        }
        break;

      case '6':
        anonymousDemo();
        break;

      case '7':
        arrowDemo();
        break;

      case '8':
        printHeader("Exiting System. Goodbye!");
        exit(0);

      default:
        print("${red}Invalid choice! Try again.${reset}");
    }
  }
}
