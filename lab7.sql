CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)  NOT NULL
);

CREATE TABLE news (
   id INT PRIMARY KEY AUTO_INCREMENT,
   date DATETIME NOT NULL,
   title VARCHAR(255) NOT NULL,
   text TEXT NOT NULL,
   category INT NOT NULL,
   FOREIGN KEY (category) REFERENCES categories(id) 
);

CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    news INT NOT NULL,
    commenter_name VARCHAR(255) NOT NULL,
    comment TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (news) REFERENCES news(id)
);

CREATE TABLE rates (
   id INT PRIMARY KEY AUTO_INCREMENT,
   date DATETIME NOT NULL,
   news INT NOT NULL,
   user_id INT,
   user_ip VARCHAR(45) NOT NULL,
   rate_value INT CHECK (rate_value >= 1 AND rate_value <= 10),
  FOREIGN KEY (news) REFERENCES news(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);



