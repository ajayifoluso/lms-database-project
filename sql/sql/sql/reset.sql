-- ============================================================
-- Learning Management System (LMS) - Reset Script
-- Drops all tables in dependency order (children before parents)
-- ============================================================

-- Drop dependent tables first to avoid FK constraint violations
DROP TABLE certificates      CASCADE CONSTRAINTS PURGE;
DROP TABLE quiz_attempts     CASCADE CONSTRAINTS PURGE;
DROP TABLE quiz_questions    CASCADE CONSTRAINTS PURGE;
DROP TABLE quizzes           CASCADE CONSTRAINTS PURGE;
DROP TABLE reviews           CASCADE CONSTRAINTS PURGE;
DROP TABLE progress          CASCADE CONSTRAINTS PURGE;
DROP TABLE enrollments       CASCADE CONSTRAINTS PURGE;
DROP TABLE lessons           CASCADE CONSTRAINTS PURGE;
DROP TABLE modules           CASCADE CONSTRAINTS PURGE;
DROP TABLE courses           CASCADE CONSTRAINTS PURGE;
DROP TABLE categories        CASCADE CONSTRAINTS PURGE;
DROP TABLE users             CASCADE CONSTRAINTS PURGE;
