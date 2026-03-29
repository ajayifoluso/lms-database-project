-- ============================================================
-- Learning Management System (LMS) - Schema
-- Oracle SQL DDL
-- ============================================================

-- Users table: stores all platform users (students, instructors, admins)
CREATE TABLE users (
    user_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name  VARCHAR2(50)  NOT NULL,
    last_name   VARCHAR2(50)  NOT NULL,
    email       VARCHAR2(100) NOT NULL UNIQUE,
    password_hash VARCHAR2(255) NOT NULL,
    role        VARCHAR2(20)  NOT NULL CHECK (role IN ('student', 'instructor', 'admin')),
    created_at  DATE DEFAULT SYSDATE NOT NULL
);

-- Categories table: organizes courses into subject areas
CREATE TABLE categories (
    category_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR2(100) NOT NULL UNIQUE,
    description   VARCHAR2(500)
);

-- Courses table: core course information
CREATE TABLE courses (
    course_id    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title        VARCHAR2(200) NOT NULL,
    description  VARCHAR2(1000),
    category_id  NUMBER NOT NULL,
    instructor_id NUMBER NOT NULL,
    price        NUMBER(8,2) DEFAULT 0 CHECK (price >= 0),
    status       VARCHAR2(20) DEFAULT 'draft' CHECK (status IN ('draft', 'published', 'archived')),
    created_at   DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT fk_course_category   FOREIGN KEY (category_id)   REFERENCES categories(category_id),
    CONSTRAINT fk_course_instructor FOREIGN KEY (instructor_id) REFERENCES users(user_id)
);

-- Modules table: sections within a course
CREATE TABLE modules (
    module_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_id   NUMBER NOT NULL,
    title       VARCHAR2(200) NOT NULL,
    position    NUMBER NOT NULL CHECK (position > 0),
    CONSTRAINT fk_module_course FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- Lessons table: individual content units within a module
CREATE TABLE lessons (
    lesson_id    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    module_id    NUMBER NOT NULL,
    title        VARCHAR2(200) NOT NULL,
    content_type VARCHAR2(20) NOT NULL CHECK (content_type IN ('video', 'text', 'quiz', 'assignment')),
    content_url  VARCHAR2(500),
    duration_min NUMBER CHECK (duration_min >= 0),
    position     NUMBER NOT NULL CHECK (position > 0),
    CONSTRAINT fk_lesson_module FOREIGN KEY (module_id) REFERENCES modules(module_id) ON DELETE CASCADE
);

-- Enrollments table: records which students are enrolled in which courses
CREATE TABLE enrollments (
    enrollment_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id    NUMBER NOT NULL,
    course_id     NUMBER NOT NULL,
    enrolled_at   DATE DEFAULT SYSDATE NOT NULL,
    status        VARCHAR2(20) DEFAULT 'active' CHECK (status IN ('active', 'completed', 'dropped')),
    CONSTRAINT fk_enrollment_student FOREIGN KEY (student_id) REFERENCES users(user_id),
    CONSTRAINT fk_enrollment_course  FOREIGN KEY (course_id)  REFERENCES courses(course_id),
    CONSTRAINT uq_enrollment UNIQUE (student_id, course_id)
);

-- Progress table: tracks lesson completion per student
CREATE TABLE progress (
    progress_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    enrollment_id NUMBER NOT NULL,
    lesson_id     NUMBER NOT NULL,
    completed_at  DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT fk_progress_enrollment FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id) ON DELETE CASCADE,
    CONSTRAINT fk_progress_lesson     FOREIGN KEY (lesson_id)     REFERENCES lessons(lesson_id),
    CONSTRAINT uq_progress UNIQUE (enrollment_id, lesson_id)
);

-- Quizzes table: quiz definitions linked to lessons
CREATE TABLE quizzes (
    quiz_id       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lesson_id     NUMBER NOT NULL UNIQUE,
    passing_score NUMBER(5,2) DEFAULT 70 CHECK (passing_score BETWEEN 0 AND 100),
    time_limit_min NUMBER CHECK (time_limit_min > 0),
    CONSTRAINT fk_quiz_lesson FOREIGN KEY (lesson_id) REFERENCES lessons(lesson_id) ON DELETE CASCADE
);

-- Quiz questions table
CREATE TABLE quiz_questions (
    question_id  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    quiz_id      NUMBER NOT NULL,
    question_text VARCHAR2(1000) NOT NULL,
    correct_answer VARCHAR2(500) NOT NULL,
    points       NUMBER DEFAULT 1 CHECK (points > 0),
    CONSTRAINT fk_question_quiz FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id) ON DELETE CASCADE
);

-- Quiz attempts table: student quiz submissions
CREATE TABLE quiz_attempts (
    attempt_id    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    quiz_id       NUMBER NOT NULL,
    student_id    NUMBER NOT NULL,
    score         NUMBER(5,2) CHECK (score BETWEEN 0 AND 100),
    passed        CHAR(1) DEFAULT 'N' CHECK (passed IN ('Y', 'N')),
    attempted_at  DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT fk_attempt_quiz    FOREIGN KEY (quiz_id)    REFERENCES quizzes(quiz_id),
    CONSTRAINT fk_attempt_student FOREIGN KEY (student_id) REFERENCES users(user_id)
);

-- Reviews table: student course reviews and ratings
CREATE TABLE reviews (
    review_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_id   NUMBER NOT NULL,
    student_id  NUMBER NOT NULL,
    rating      NUMBER(2,1) NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text VARCHAR2(2000),
    created_at  DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT fk_review_course  FOREIGN KEY (course_id)  REFERENCES courses(course_id),
    CONSTRAINT fk_review_student FOREIGN KEY (student_id) REFERENCES users(user_id),
    CONSTRAINT uq_review UNIQUE (course_id, student_id)
);

-- Certificates table: issued upon course completion
CREATE TABLE certificates (
    certificate_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    enrollment_id  NUMBER NOT NULL UNIQUE,
    issued_at      DATE DEFAULT SYSDATE NOT NULL,
    certificate_code VARCHAR2(50) NOT NULL UNIQUE,
    CONSTRAINT fk_cert_enrollment FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);
