SET DEFINE OFF;
-- ============================================================
-- Learning Management System (LMS) - Sample Data
-- Insert in dependency order
-- ============================================================

-- Categories
INSERT INTO categories (name, description) VALUES ('Web Development', 'Frontend and backend web technologies');
INSERT INTO categories (name, description) VALUES ('Data Science', 'Data analysis, ML and statistics');
INSERT INTO categories (name, description) VALUES ('Cybersecurity', 'Network security and ethical hacking');
INSERT INTO categories (name, description) VALUES ('Cloud Computing', 'AWS, Azure and GCP platforms');

-- Users (2 admins, 2 instructors, 5 students)
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES ('Admin', 'User', 'admin@lms.com', 'hashed_pw_001', 'admin');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES ('John', 'Smith', 'john.smith@lms.com', 'hashed_pw_002', 'instructor');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES ('Sarah', 'Johnson', 'sarah.j@lms.com', 'hashed_pw_003', 'instructor');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES ('Mike', 'Brown', 'mike.b@lms.com', 'hashed_pw_004', 'student');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES ('Lisa', 'Davis', 'lisa.d@lms.com', 'hashed_pw_005', 'student');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES ('Tom', 'Wilson', 'tom.w@lms.com', 'hashed_pw_006', 'student');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES ('Emma', 'Garcia', 'emma.g@lms.com', 'hashed_pw_007', 'student');
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES ('James', 'Martinez', 'james.m@lms.com', 'hashed_pw_008', 'student');

-- Courses
INSERT INTO courses (title, description, instructor_id, category_id, price, difficulty, is_published)
VALUES ('HTML & CSS Fundamentals', 'Learn the building blocks of web development', 2, 1, 49.99, 'beginner', 'Y');

INSERT INTO courses (title, description, instructor_id, category_id, price, difficulty, is_published)
VALUES ('Python for Data Science', 'Hands-on data analysis with Python and Pandas', 3, 2, 79.99, 'intermediate', 'Y');

INSERT INTO courses (title, description, instructor_id, category_id, price, difficulty, is_published)
VALUES ('Ethical Hacking Basics', 'Introduction to penetration testing and network security', 2, 3, 99.99, 'beginner', 'Y');

INSERT INTO courses (title, description, instructor_id, category_id, price, difficulty, is_published)
VALUES ('AWS Cloud Practitioner', 'Prepare for AWS certification with hands-on labs', 3, 4, 89.99, 'intermediate', 'Y');

-- Modules (3 per course)
INSERT INTO modules (course_id, title, position) VALUES (1, 'Getting Started with HTML', 1);
INSERT INTO modules (course_id, title, position) VALUES (1, 'Styling with CSS', 2);
INSERT INTO modules (course_id, title, position) VALUES (1, 'Responsive Design', 3);

INSERT INTO modules (course_id, title, position) VALUES (2, 'Python Basics', 1);
INSERT INTO modules (course_id, title, position) VALUES (2, 'Data Manipulation with Pandas', 2);
INSERT INTO modules (course_id, title, position) VALUES (2, 'Data Visualization', 3);

INSERT INTO modules (course_id, title, position) VALUES (3, 'Network Fundamentals', 1);
INSERT INTO modules (course_id, title, position) VALUES (3, 'Scanning and Enumeration', 2);

INSERT INTO modules (course_id, title, position) VALUES (4, 'Cloud Concepts', 1);
INSERT INTO modules (course_id, title, position) VALUES (4, 'AWS Core Services', 2);

-- Lessons (2 per module)
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (1, 'What is HTML?', 15, 1);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (1, 'HTML Tags and Structure', 20, 2);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (2, 'CSS Selectors', 25, 1);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (2, 'Box Model and Layout', 30, 2);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (3, 'Media Queries', 20, 1);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (3, 'Flexbox Basics', 25, 2);

INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (4, 'Variables and Data Types', 20, 1);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (4, 'Control Flow', 25, 2);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (5, 'DataFrames', 30, 1);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (5, 'Filtering and Grouping', 30, 2);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (6, 'Matplotlib Basics', 25, 1);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (6, 'Seaborn Charts', 25, 2);

INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (7, 'OSI Model', 20, 1);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (7, 'TCP/IP Protocols', 25, 2);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (8, 'Nmap Scanning', 30, 1);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (8, 'Vulnerability Assessment', 35, 2);

INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (9, 'What is Cloud Computing?', 15, 1);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (9, 'AWS Global Infrastructure', 20, 2);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (10, 'EC2 Instances', 30, 1);
INSERT INTO lessons (module_id, title, duration_mins, position) VALUES (10, 'S3 Storage', 25, 2);

-- Enrollments
INSERT INTO enrollments (student_id, course_id, status) VALUES (4, 1, 'active');
INSERT INTO enrollments (student_id, course_id, status) VALUES (4, 2, 'active');
INSERT INTO enrollments (student_id, course_id, status) VALUES (5, 1, 'completed');
INSERT INTO enrollments (student_id, course_id, status) VALUES (5, 3, 'active');
INSERT INTO enrollments (student_id, course_id, status) VALUES (6, 2, 'active');
INSERT INTO enrollments (student_id, course_id, status) VALUES (6, 4, 'active');
INSERT INTO enrollments (student_id, course_id, status) VALUES (7, 1, 'active');
INSERT INTO enrollments (student_id, course_id, status) VALUES (7, 4, 'completed');
INSERT INTO enrollments (student_id, course_id, status) VALUES (8, 3, 'active');
INSERT INTO enrollments (student_id, course_id, status) VALUES (8, 2, 'dropped');

-- Progress (some lessons completed)
INSERT INTO progress (enrollment_id, lesson_id, completed, completed_at) VALUES (1, 1, 'Y', SYSDATE-10);
INSERT INTO progress (enrollment_id, lesson_id, completed, completed_at) VALUES (1, 2, 'Y', SYSDATE-9);
INSERT INTO progress (enrollment_id, lesson_id, completed, completed_at) VALUES (1, 3, 'Y', SYSDATE-8);
INSERT INTO progress (enrollment_id, lesson_id, completed) VALUES (1, 4, 'N');
INSERT INTO progress (enrollment_id, lesson_id, completed, completed_at) VALUES (3, 1, 'Y', SYSDATE-20);
INSERT INTO progress (enrollment_id, lesson_id, completed, completed_at) VALUES (3, 2, 'Y', SYSDATE-19);
INSERT INTO progress (enrollment_id, lesson_id, completed, completed_at) VALUES (3, 3, 'Y', SYSDATE-18);
INSERT INTO progress (enrollment_id, lesson_id, completed, completed_at) VALUES (3, 4, 'Y', SYSDATE-17);
INSERT INTO progress (enrollment_id, lesson_id, completed, completed_at) VALUES (3, 5, 'Y', SYSDATE-16);
INSERT INTO progress (enrollment_id, lesson_id, completed, completed_at) VALUES (3, 6, 'Y', SYSDATE-15);

-- Quizzes
INSERT INTO quizzes (module_id, title, pass_score) VALUES (1, 'HTML Basics Quiz', 70);
INSERT INTO quizzes (module_id, title, pass_score) VALUES (2, 'CSS Quiz', 70);
INSERT INTO quizzes (module_id, title, pass_score) VALUES (4, 'Python Basics Quiz', 75);
INSERT INTO quizzes (module_id, title, pass_score) VALUES (7, 'Networking Quiz', 80);

-- Quiz Questions
INSERT INTO quiz_questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_ans)
VALUES (1, 'What does HTML stand for?', 'Hyper Text Markup Language', 'High Tech Modern Language', 'Hyper Transfer Markup Logic', 'Home Tool Markup Language', 'A');

INSERT INTO quiz_questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_ans)
VALUES (1, 'Which tag creates a hyperlink?', '<link>', '<a>', '<href>', '<url>', 'B');

INSERT INTO quiz_questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_ans)
VALUES (2, 'Which property sets text color in CSS?', 'font-color', 'text-color', 'color', 'style', 'C');

INSERT INTO quiz_questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_ans)
VALUES (3, 'Which keyword defines a variable in Python?', 'var', 'let', 'dim', 'No keyword needed', 'D');

INSERT INTO quiz_questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_ans)
VALUES (4, 'How many layers does the OSI model have?', '5', '6', '7', '8', 'C');

-- Quiz Attempts
INSERT INTO quiz_attempts (quiz_id, student_id, score, passed) VALUES (1, 4, 85, 'Y');
INSERT INTO quiz_attempts (quiz_id, student_id, score, passed) VALUES (1, 5, 90, 'Y');
INSERT INTO quiz_attempts (quiz_id, student_id, score, passed) VALUES (2, 5, 75, 'Y');
INSERT INTO quiz_attempts (quiz_id, student_id, score, passed) VALUES (3, 6, 60, 'N');
INSERT INTO quiz_attempts (quiz_id, student_id, score, passed) VALUES (3, 6, 80, 'Y');
INSERT INTO quiz_attempts (quiz_id, student_id, score, passed) VALUES (4, 9, 85, 'Y');

-- Reviews
INSERT INTO reviews (course_id, student_id, rating, review_text) VALUES (1, 4, 5, 'Excellent course! Very beginner friendly and well structured.');
INSERT INTO reviews (course_id, student_id, rating, review_text) VALUES (1, 5, 4, 'Great content. Would love more practice exercises.');
INSERT INTO reviews (course_id, student_id, rating, review_text) VALUES (2, 6, 5, 'Best Python course I have taken. Very practical.');
INSERT INTO reviews (course_id, student_id, rating, review_text) VALUES (3, 5, 4, 'Solid introduction to cybersecurity concepts.');
INSERT INTO reviews (course_id, student_id, rating, review_text) VALUES (4, 7, 5, 'Helped me pass my AWS exam on first try!');

-- Certificates (for completed enrollments)
INSERT INTO certificates (enrollment_id, certificate_code) VALUES (3, 'CERT-LMS-2026-0001');
INSERT INTO certificates (enrollment_id, certificate_code) VALUES (8, 'CERT-LMS-2026-0002');

COMMIT;
