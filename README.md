# 📚 Learning Management System (LMS) Database

A relational database project designed and implemented for a Learning Management System. Built using Oracle SQL with full normalization to Third Normal Form (3NF), demonstrating proper database design, SQL implementation, and data management principles.

---

## 📋 Project Overview

This database supports a fully functional Learning Management System where instructors can create courses, students can enroll and track progress, and administrators can manage the platform. The system handles everything from course content delivery to quiz assessments and certificate issuance.

---

## 🗂️ Database Tables (12 Tables)

| Table | Description |
|---|---|
| `categories` | Course subject categories (Web Dev, Data Science, etc.) |
| `users` | All platform users — students, instructors, and admins |
| `courses` | Courses created by instructors with pricing and difficulty |
| `modules` | Sections within each course |
| `lessons` | Individual lessons within each module |
| `enrollments` | Student course enrollments and completion status |
| `progress` | Lesson-level completion tracking per student |
| `quizzes` | Assessments attached to course modules |
| `quiz_questions` | Individual questions with multiple choice options |
| `quiz_attempts` | Student quiz attempt records and scores |
| `reviews` | Student ratings and reviews for completed courses |
| `certificates` | Certificates issued upon course completion |

---

## 🔗 Entity Relationships

- A **User** can be a student, instructor, or admin
- An **Instructor** creates many **Courses**
- A **Course** belongs to one **Category** and has many **Modules**
- A **Module** contains many **Lessons** and may have a **Quiz**
- A **Student** enrolls in many **Courses** via **Enrollments**
- **Progress** tracks which **Lessons** a student has completed
- A **Certificate** is issued when an **Enrollment** is completed

---

## 📁 Repository Structure

```
lms-database-project/
├── README.md
└── sql/
    ├── schema.sql       # DDL — creates all 12 tables with PKs, FKs, constraints
    ├── sample_data.sql  # DML — inserts representative data across all tables
    └── reset.sql        # Drops all tables in correct dependency order
```

---

## ⚙️ How to Run

### Prerequisites
- Oracle Database (provided credentials)
- Oracle SQL Developer

### Setup Instructions

**Step 1 — Connect to Oracle**
Open Oracle SQL Developer and connect using your provided credentials.

**Step 2 — Reset (if needed)**
Run `sql/reset.sql` to drop any existing tables.

**Step 3 — Create Tables**
Run `sql/schema.sql` to create all 12 tables.
Expected output: 12 x "Table created."

**Step 4 — Load Sample Data**
Run `sql/sample_data.sql` to insert representative data.
Expected output: multiple "1 row inserted." and "Commit complete."

**Step 5 — Verify**
```sql
SELECT table_name FROM user_tables ORDER BY table_name;
```

---

## 📊 Sample Data Summary

| Table | Records |
|---|---|
| categories | 4 |
| users | 8 (1 admin, 2 instructors, 5 students) |
| courses | 4 |
| modules | 10 |
| lessons | 20 |
| enrollments | 10 |
| progress | 10 |
| quizzes | 4 |
| quiz_questions | 5 |
| quiz_attempts | 5 |
| reviews | 5 |
| certificates | 2 |

---

## 🏗️ Design Decisions

- **Normalized to 3NF** — all tables eliminate transitive dependencies
- **Identity columns** used for all primary keys for auto-increment behavior
- **CHECK constraints** enforce valid values (roles, status, ratings, scores)
- **UNIQUE constraints** prevent duplicate enrollments and reviews
- **CASCADE CONSTRAINTS** used in reset script for safe dependency-order drops
- **`difficulty`** column used instead of `level` to avoid Oracle reserved word conflict

---

## 👤 Author

**Foluso Ajayi**
Monroe University — King Graduate School
FINAL PROJECT REPORT
Database Management Course — 2026
