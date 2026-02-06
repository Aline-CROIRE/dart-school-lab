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
