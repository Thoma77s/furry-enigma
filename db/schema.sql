DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;
USE employees;

CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);

CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);

use employees;
INSERT INTO department
    (name)
VALUES
    ('Development'),
    ('Analytics'),
    ('Marketing'),
    ('Executive');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('Manager', 100000, 1),
    ('Junior Developer', 75000, 1),
    ('Senior Developer', 110000, 2),
    ('Analytics', 75000, 2),
    ('Social Media Marketing', 70000, 3),
    ('Marketing', 80000, 3),
    ('CEO', 200000, 4),
    ('CTO', 180000, 4);
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('Thomas', 'Siffermann', 1, NULL),
    ('Joe', 'Schmo', 2, 1),
    ('Michael', 'Goblin', 3, NULL),
    ('Steve', 'Foster', 4, 3),
    ('Shawn', 'Longjohn', 5, NULL),
    ('Gary', 'Sanders', 6, 5),
    ('Burt', 'Johnson', 7, NULL),
    ('Scott', 'Forester', 8, 7);