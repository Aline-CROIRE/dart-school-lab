# Dart School Management System

[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)

---

## Table of Contents

- [Project Overview](#-project-overview)
- [Features](#-features)
- [Lab Questions Coverage](#-lab-questions-coverage--placeholders)
- [Installation Instructions](#-installation-instructions)
- [Usage](#-usage)
- [Project Structure](#-project-structure)
- [Color-Coding in Console](#-color-coding-in-console)
- [Submission Guidelines](#-submission-guidelines)
- [Authors](#-authors)
- [License](#-license)

---

##  Project Overview

This is a **console-based School Management System** built in **Dart** to demonstrate core programming concepts for **Dart Programming Lab 1**.

The system allows users to:

- Create students and teachers
- Mark attendance and track courses
- View a student dashboard
- Register courses with notifications
- Demonstrate collections, anonymous/arrow functions, and async programming

It covers all lab questions (Q1–Q20) with clear examples, proper structure, and an **interactive menu-based UI**.

---

##  Features

| Feature | Description |
|---------|-------------|
| **Student Management** | Create and manage student records with detailed information |
| **Teacher Management** | Add teachers with optional parameters |
| **Attendance Tracking** | Mark and monitor student attendance using mixins |
| **Course Registration** | Register students to courses with real-time notifications |
| **Interactive Dashboard** | View all students, their courses, and attendance records |
| **Async Operations** | Demonstrate asynchronous programming with data loading |
| **Collections Demo** | Show Lists and Maps usage in Dart |
| **Functional Programming** | Examples of anonymous and arrow functions |

---

##  Lab Questions Coverage & Placeholders

The table below lists each lab question, its implementation in the system, and placeholders where screenshots and scanned handwritten summaries should be included.

| Question | Feature / Implementation | Screenshot | Handwritten Summary |
|:--------:|--------------------------|:----------:|:-------------------:|
| **Q1** | `welcomeMessage()` function displays the welcome message | ![Q1 Screenshot](screenshots/q1.png) | [📄 Scanned Report Q1](reports/q1.jpg) |
| **Q2** | `createStudent()` with named parameters | ![Q2 Screenshot](screenshots/q2.png) | [📄 Scanned Report Q2](reports/q2.jpg) |
| **Q3** | `createTeacher()` with optional parameter | ![Q3 Screenshot](screenshots/q3.png) | [📄 Scanned Report Q3](reports/q3.jpg) |
| **Q4** | `Student` class with constructor | ![Q4 Screenshot](screenshots/q4.png) | [📄 Scanned Report Q4](reports/q4.jpg) |
| **Q5** | Create `Student` object & print details | ![Q5 Screenshot](screenshots/q5.png) | [📄 Scanned Report Q5](reports/q5.jpg) |
| **Q6** | `Person` class | ![Q6 Screenshot](screenshots/q6.png) | [📄 Scanned Report Q6](reports/q6.jpg) |
| **Q7** | `StudentPerson` inheritance & `introduce()` | ![Q7 Screenshot](screenshots/q7.png) | [📄 Scanned Report Q7](reports/q7.jpg) |
| **Q8** | `Registrable` interface | ![Q8 Screenshot](screenshots/q8.png) | [📄 Scanned Report Q8](reports/q8.jpg) |
| **Q9** | Implement `registerCourse()` in Student | ![Q9 Screenshot](screenshots/q9.png) | [📄 Scanned Report Q9](reports/q9.jpg) |
| **Q10** | `AttendanceMixin` | ![Q10 Screenshot](screenshots/q10.png) | [📄 Scanned Report Q10](reports/q10.jpg) |
| **Q11** | Apply AttendanceMixin & mark attendance | ![Q11 Screenshot](screenshots/q11.png) | [📄 Scanned Report Q11](reports/q11.jpg) |
| **Q12** | List of Students | ![Q12 Screenshot](screenshots/q12.png) | [📄 Scanned Report Q12](reports/q12.jpg) |
| **Q13** | Map of Students | ![Q13 Screenshot](screenshots/q13.png) | [📄 Scanned Report Q13](reports/q13.jpg) |
| **Q14** | Anonymous function demo | ![Q14 Screenshot](screenshots/q14.png) | [📄 Scanned Report Q14](reports/q14.jpg) |
| **Q15** | Arrow function demo | ![Q15 Screenshot](screenshots/q15.png) | [📄 Scanned Report Q15](reports/q15.jpg) |
| **Q16** | Async function `loadStudents()` | ![Q16 Screenshot](screenshots/q16.png) | [📄 Scanned Report Q16](reports/q16.jpg) |
| **Q17** | Await call in `main()` | ![Q17 Screenshot](screenshots/q17.png) | [📄 Scanned Report Q17](reports/q17.jpg) |
| **Q18** | Handwritten explanation of mixins vs inheritance | N/A | [📄 Scanned Report Q18](reports/q18.jpg) |
| **Q19** | `NotificationMixin` demo | ![Q19 Screenshot](screenshots/q19.png) | [📄 Scanned Report Q19](reports/q19.jpg) |
| **Q20** | Handwritten paragraph: Dart & Flutter | N/A | [📄 Scanned Report Q20](reports/q20.jpg) |


---

##  Installation Instructions

### Prerequisites

- Dart SDK (version 2.12 or higher)
- Flutter SDK (optional, for Flutter-related features)

### Steps

1. **Install Dart & Flutter**:
   
   Follow the official guide: [Flutter Installation](https://flutter.dev/docs/get-started/install)

2. **Clone the Repository**:

   ```bash
   git clone https://github.com/<your-username>/dart-school-lab.git
   cd dart-school-lab
   ```

3. **Run the Project**:

   ```bash
   dart run main.dart
   ```

   The system runs entirely in the console.

---

## 💻 Usage

When you run the program:

1.  You will see a **welcome message** (Q1).

2.  Use the menu to **create students and teachers** (Q2-Q3).

3.  Access the **Student Dashboard** to view all students, attendance, and courses (Q11-Q13).

4.  **Mark attendance** (Q10-Q11) and **register courses** (Q9, Q19).

5.  **Anonymous & Arrow functions** are accessible via menu (Q14-Q15).

6. The system preloads demo students: **Aline**, **Gaetan**, **Alice**.

7.  **Exit** the program anytime using the menu option.

### Sample Menu

```
========================================
   DART SCHOOL MANAGEMENT SYSTEM
========================================
1. Create Student
2. Create Teacher
3. Student Dashboard
4. Mark Attendance
5. Register Course
6. Demo Functions
7. Exit
========================================
Enter your choice:
```

---

##  Project Structure

```
dart-school-lab/
│
├─ main.dart           # All Dart code implementing Q1-Q20
├─ README.md           # Project description & usage instructions
├─ screenshots/        # Add screenshots of outputs for each question
│  ├─ q1.png
│  ├─ q2.png
│  └─ ...
└─ reports/            # Add scanned handwritten report for each question
   ├─ q1.jpg
   ├─ q2.jpg
   └─ ...
```

---

##  Color-Coding in Console

The system uses **ANSI color codes** for better visual experience:

| Color | Usage | Example |
|-------|-------|---------|
| 🟢 **Green** | Success messages | Attendance marked, registration successful |
| 🟡 **Yellow** | Notifications | Student added, course registered |
| 🔴 **Red** | Errors or invalid inputs | Invalid menu choice, missing data |
| 🔵 **Blue/Cyan/Magenta** | Headers / Menus | Section titles, menu options |

---



## 👥 Authors

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/<aline-username>">
        <img src="https://github.com/identicons/<aline-username>.png" width="100px;" alt="Aline NIYONIZERA"/>
        <br />
        <sub><b>Aline NIYONIZERA</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/<gaetan-username>">
        <img src="https://github.com/identicons/<gaetan-username>.png" width="100px;" alt="Gaetan UWIZEYIMANA"/>
        <br />
        <sub><b>Gaetan UWIZEYIMANA</b></sub>
      </a>
    </td>
  </tr>
</table>

---

## 📄 License

This project is created for **educational purposes** as part of **Dart Programming Lab 1**.

```
Copyright (c) 2024 Aline NIYONIZERA & Gaetan UWIZEYIMANA

Permission is hereby granted to use this software for educational purposes only.
```

---

## 🌟 Acknowledgments

- Thanks to our instructors for guidance
- Dart and Flutter documentation
- The open-source community

---

<div align="center">



[⬆ Back to Top](#-dart-school-management-system)

</div>
