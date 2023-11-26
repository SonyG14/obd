CREATE TABLE categories (
  id INT PRIMARY AUTO_INCREMENT,
  name VARCHAR(255)  NOT NULL
);

CREATE TABLE news (
   id INT PRIMARY KEY AUTO_INCREMENT,
   date DATETIME NOT NULL,
   title VARCHAR(255) NOT NULL,
   text TEXT NOT NULL,
   category_id INT,
   FOREIGN KEY (category_id) REFERENCES categories(id) 
);

CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    news_id INT,
    commenter_name VARCHAR(255) NOT NULL,
    text TEXT NOT NULL,
    FOREIGN KEY (news_id) REFERENCES news(id)
);

CREATE TABLE rates (
   id INT PRIMARY KEY AUTO_INCREMENT,
   date DATETIME NOT NULL,
   news_id INT NOT NULL,
   user_ip VARCHAR(45) NOT NULL,
   rate_value INT CHECK (rate_value >= 1 AND rate_value <= 10),
  FOREIGN KEY (news_id) REFERENCES news(id)
);



