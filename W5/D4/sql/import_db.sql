PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR (100) NOT NULL,
  lname VARCHAR (100) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR (100) NOT NULL,
  body VARCHAR (600) NOT NULL,
  author INTEGER NOT NULL,
  FOREIGN KEY (author) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL ,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  reference_question INTEGER NOT NULL,
  parent_id INTEGER,
  body VARCHAR (500) NOT NULL,
  top_reply BOOLEAN NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (reference_question) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_liked INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_liked) REFERENCES questions(id)
);

INSERT INTO 
users (fname, lname)
VALUES
  ("gorgon", "milosovich"),
  ("luke", "skywalker"),
  ("c3p0", "robot"),
  ("leia", "alderan"),
  ("my", "name");

  INSERT INTO
    questions (title, body, author)
  VALUES
    ("i'm lost", "where am i?", (SELECT id FROM users WHERE fname = "c3p0")),
    ("my name", "what's my name?", (SELECT id FROM users WHERE fname = "my")),
    ("my daddy", "who's your daddy?", (SELECT id FROM users WHERE fname = "luke"));

    INSERT INTO
      question_follows (user_id, question_id)
    VALUES
      (1,(SELECT id FROM questions WHERE title = "i'm lost")),
      (3, (SELECT id FROM questions WHERE title = "i'm lost")),
      (3, (SELECT id FROM questions WHERE title = "my name")),
      (3, (SELECT id FROM questions WHERE title = "my daddy")),
      (4, (SELECT id FROM questions WHERE title = "i'm lost")),
      (2, (SELECT id FROM questions WHERE title = "i'm lost"));

    INSERT INTO
      replies (reference_question, parent_id, body, top_reply, user_id)
    VALUES
     (3, NULL , "I'm your daddy.", 1, 1 ),
     (3 , 1, "Your a troll.", 0, 2),
     (3, 2, "For sure!", 0, 4),
     (1, NULL, "You are next to me.", 1, 2),
     (1, 4, "Thank you!", 0, 3);

    INSERT INTO
      question_likes (user_id, question_liked)
    VALUES
      (3, 1),
      (2, 1),
      (4, 1);

