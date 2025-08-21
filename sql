-- Create a new database
CREATE DATABASE fitness_tracker;

-- Connect to the new database
\c fitness_tracker;

-- User Profile
CREATE TABLE users (
    user_id VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    weight DECIMAL(5, 2)
);

-- Friends List (Many-to-Many Relationship)
CREATE TABLE friends (
    user_id VARCHAR(255) REFERENCES users(user_id),
    friend_id VARCHAR(255) REFERENCES users(user_id),
    PRIMARY KEY (user_id, friend_id)
);

-- Workouts
CREATE TABLE workouts (
    workout_id VARCHAR(255) PRIMARY KEY,
    user_id VARCHAR(255) REFERENCES users(user_id),
    duration_minutes INT NOT NULL
);

-- Exercises within a Workout
CREATE TABLE exercises (
    exercise_id VARCHAR(255) PRIMARY KEY,
    workout_id VARCHAR(255) REFERENCES workouts(workout_id),
    exercise_name VARCHAR(255) NOT NULL,
    reps INT,
    sets INT,
    weight_lifted DECIMAL(10, 2)
);

-- Personal Goals
CREATE TABLE goals (
    goal_id VARCHAR(255) PRIMARY KEY,
    user_id VARCHAR(255) REFERENCES users(user_id),
    goal_description TEXT,
    target_value INT,
    is_completed BOOLEAN DEFAULT FALSE
);
