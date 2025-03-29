CREATE TABLE IF NOT EXISTS users (
    id SERIAL NOT NULL UNIQUE PRIMARY KEY,
    login VARCHAR(330) NOT NULL UNIQUE,
    password_hash VARCHAR(100) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    telegram VARCHAR(100) UNIQUE,
    phone VARCHAR(100) UNIQUE,
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE,
    instructor INTEGER NOT NULL,
    is_instructor BOOLEAN NOT NULL DEFAULT FALSE,
    instructor_vacations VARCHAR(100),
    instructor_working_hours VARCHAR(100)
);
COMMENT ON COLUMN users.id IS 'unique numeric id for each user';
COMMENT ON COLUMN users.login IS 'users`s email address';
COMMENT ON COLUMN users.password_hash IS 'hashed and salted users`s password';
COMMENT ON COLUMN users.is_active IS 'is user active?';
COMMENT ON COLUMN users.first_name IS 'users`s first name';
COMMENT ON COLUMN users.middle_name IS 'users`s middle name';
COMMENT ON COLUMN users.last_name IS 'users`s last name';
COMMENT ON COLUMN users.telegram IS 'users`s telegram login';
COMMENT ON COLUMN users.phone IS 'users`s phone number';
COMMENT ON COLUMN users.registration_date IS 'date of user`s registration';
COMMENT ON COLUMN users.instructor IS 'users`s instructor id';
COMMENT ON COLUMN users.is_instructor IS 'is user a instructor (admin)?';
COMMENT ON COLUMN users.instructor_vacations IS 'instructor`s vacation days (e.g. saturday and sunday = `6,7` or `1,5,7`)';
COMMENT ON COLUMN users.instructor_working_hours IS 'instructor`s working hours (e.g. `09:00-18:00` or `09:00-12:00,13:00-19:00`)';




CREATE TABLE IF NOT EXISTS records (
    id SERIAL NOT NULL UNIQUE PRIMARY KEY,
    user_id INTEGER NOT NULL,
    start_time TIMESTAMP NOT NULL,
);
COMMENT ON COLUMN records.id IS 'unique numeric id for each record';
COMMENT ON COLUMN records.user_id IS 'users`s id';
COMMENT ON COLUMN records.start_time IS 'start date and time of user`s record';