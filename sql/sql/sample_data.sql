-- ============================================================
-- Learning Management System (LMS) - Sample Data
-- ============================================================

-- Users
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES
    ('Alice',   'Johnson',  'alice@lms.com',   'hashed_pw_1', 'admin');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES
    ('Bob',     'Smith',    'bob@lms.com',     'hashed_pw_2', 'instructor');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES
    ('Carol',   'Davis',    'carol@lms.com',   'hashed_pw_3', 'instructor');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES
    ('David',   'Lee',      'david@lms.com',   'hashed_pw_4', 'student');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES
    ('Eva',     'Martinez', 'eva@lms.com',     'hashed_pw_5', 'student');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES
    ('Frank',   'Wilson',   'frank@lms.com',   'hashed_pw_6', 'student');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES
    ('Grace',   'Kim',      'grace@lms.com',   'hashed_pw_7', 'student');

-- Categories
INSERT INTO categories (category_name, description) VALUES
    ('Web Development', 'Front-end and back-end web technologies');
INSERT INTO categories (category_name, description) VALUES
    ('Data Science', 'Data analysis, machine learning, and statistics');
INSERT INTO categories (category_name, description) VALUES
    ('Cybersecurity', 'Network security, ethical hacking, and data protection');
INSERT INTO categories (category_name, description) VALUES
    ('Database Management', 'SQL, NoSQL, and database design principles');

-- Courses (instructor_id 2 = Bob, 3 = Carol)
INSERT INTO courses (title, description, category_id, instructor_id, price, status) VALUES
    ('HTML & CSS Fundamentals', 'Learn the building blocks of the web.', 1, 2, 49.99, 'published');
INSERT INTO courses (title, description, category_id, instructor_id, price, status) VALUES
    ('Python for Data Science', 'Master Python libraries like Pandas and NumPy.', 2, 3, 79.99, 'published');
INSERT INTO courses (title, description, category_id, instructor_id, price, status) VALUES
    ('Introduction to SQL', 'Understand relational databases and write SQL queries.', 4, 2, 59.99, 'published');
INSERT INTO courses (title, description, category_id, instructor_id, price, status) VALUES
    ('Ethical Hacking Basics', 'Beginner course on penetration testing concepts.', 3, 3, 89.99, 'draft');

-- Modules
-- Course 1: HTML & CSS
INSERT INTO modules (course_id, title, position) VALUES (1, 'Getting Started with HTML', 1);
INSERT INTO modules (course_id, title, position) VALUES (1, 'Styling with CSS', 2);
-- Course 2: Python
INSERT INTO modules (course_id, title, position) VALUES (2, 'Python Basics', 1);
INSERT INTO modules (course_id, title, position) VALUES (2, 'Working with Pandas', 2);
-- Course 3: SQL
INSERT INTO modules (course_id, title, position) VALUES (3, 'SQL Fundamentals', 1);
INSERT INTO modules (course_id, title, position) VALUES (3, 'Advanced Queries', 2);

-- Lessons (module_id 1-6 follow module insert order)
-- Module 1: HTML
INSERT INTO lessons (module_id, title, content_type, content_url, duration_min, position) VALUES
    (1, 'What is HTML?', 'video', 'https://cdn.lms.com/html-intro.mp4', 10, 1);
INSERT INTO lessons (module_id, title, content_type, content_url, duration_min, position) VALUES
    (1, 'HTML Tags Quiz', 'quiz', NULL, NULL, 2);
-- Module 2: CSS
INSERT INTO lessons (module_id, title, content_type, content_url, duration_min, position) VALUES
    (2, 'CSS Box Model', 'video', 'https://cdn.lms.com/css-box.mp4', 15, 1);
INSERT INTO lessons (module_id, title, content_type, content_url, duration_min, position) VALUES
    (2, 'CSS Assignment', 'assignment', NULL, NULL, 2);
-- Module 3: Python
INSERT INTO lessons (module_id, title, content_type, content_url, duration_min, position) VALUES
    (3, 'Python Variables', 'text', 'https://cdn.lms.com/py-vars.html', 8, 1);
INSERT INTO lessons (module_id, title, content_type, content_url, duration_min, position) VALUES
    (3, 'Python Basics Quiz', 'quiz', NULL, NULL, 2);
-- Module 5: SQL Fundamentals
INSERT INTO lessons (module_id, title, content_type, content_url, duration_min, position) VALUES
    (5, 'SELECT Statements', 'video', 'https://cdn.lms.com/sql-select.mp4', 20, 1);
INSERT INTO lessons (module_id, title, content_type, content_url, duration_min, position) VALUES
    (5, 'SQL Basics Quiz', 'quiz', NULL, NULL, 2);

-- Enrollments (student_ids: 4=David, 5=Eva, 6=Frank, 7=Grace)
INSERT INTO enrollments (student_id, course_id, status) VALUES (4, 1, 'active');
INSERT INTO enrollments (student_id, course_id, status) VALUES (4, 3, 'completed');
INSERT INTO enrollments (student_id, course_id, status) VALUES (5, 1, 'active');
INSERT INTO enrollments (student_id, course_id, status) VALUES (5, 2, 'active');
INSERT INTO enrollments (student_id, course_id, status) VALUES (6, 2, 'completed');
INSERT INTO enrollments (student_id, course_id, status) VALUES (7, 3, 'active');

-- Progress (enrollment_id 1=David/Course1, 2=David/Course3 completed, etc.)
INSERT INTO progress (enrollment_id, lesson_id) VALUES (1, 1); -- David completed lesson 1
INSERT INTO progress (enrollment_id, lesson_id) VALUES (2, 7); -- David completed SQL lesson
INSERT INTO progress (enrollment_id, lesson_id) VALUES (2, 8); -- David completed SQL quiz lesson
INSERT INTO progress (enrollment_id, lesson_id) VALUES (5, 5); -- Frank completed Python lesson
INSERT INTO progress (enrollment_id, lesson_id) VALUES (5, 6); -- Frank completed Python quiz

-- Quizzes (linked to quiz-type lessons: lesson_id 2, 6, 8)
INSERT INTO quizzes (lesson_id, passing_score, time_limit_min) VALUES (2, 70, 15);
INSERT INTO quizzes (lesson_id, passing_score, time_limit_min) VALUES (6, 75, 20);
INSERT INTO quizzes (lesson_id, passing_score, time_limit_min) VALUES (8, 70, 20);

-- Quiz Questions
INSERT INTO quiz_questions (quiz_id, question_text, correct_answer, points) VALUES
    (1, 'What does HTML stand for?', 'HyperText Markup Language', 1);
INSERT INTO quiz_questions (quiz_id, question_text, correct_answer, points) VALUES
    (1, 'Which tag creates a hyperlink?', '<a>', 1);
INSERT INTO quiz_questions (quiz_id, question_text, correct_answer, points) VALUES
    (2, 'What function prints output in Python?', 'print()', 1);
INSERT INTO quiz_questions (quiz_id, question_text, correct_answer, points) VALUES
    (3, 'Which SQL clause filters rows?', 'WHERE', 1);

-- Quiz Attempts
INSERT INTO quiz_attempts (quiz_id, student_id, score, passed) VALUES (1, 4, 85.0, 'Y');
INSERT INTO quiz_attempts (quiz_id, student_id, score, passed) VALUES (1, 5, 60.0, 'N');
INSERT INTO quiz_attempts (quiz_id, student_id, score, passed) VALUES (3, 4, 90.0, 'Y');
INSERT INTO quiz_attempts (quiz_id, student_id, score, passed) VALUES (2, 6, 80.0, 'Y');

-- Reviews
INSERT INTO reviews (course_id, student_id, rating, review_text) VALUES
    (1, 4, 4.5, 'Great beginner course, very clear explanations!');
INSERT INTO reviews (course_id, student_id, rating, review_text) VALUES
    (3, 4, 5.0, 'Best SQL intro I have found. Highly recommend.');
INSERT INTO reviews (course_id, student_id, rating, review_text) VALUES
    (2, 6, 4.0, 'Good content, would love more exercises.');

-- Certificates (for completed enrollments: enrollment_id 2=David/SQL, 5=Frank/Python)
INSERT INTO certificates (enrollment_id, certificate_code) VALUES (2, 'CERT-LMS-2024-0001');
INSERT INTO certificates (enrollment_id, certificate_code) VALUES (5, 'CERT-LMS-2024-0002');

COMMIT;
