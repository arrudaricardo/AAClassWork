require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
attr_reader :db
include Singleton

  def initialize
    @db = SQLite3::Database.new( "questions.db" )
  end

  def execute(query)
    db.execute(query)
  end
    
  def find_by_id(table, id, values)
    hash = Hash.new
    @db.execute( "select * from #{table}" ) do |row|
    if row[0] == id
      row.each_with_index do |el, idx|
        hash[values[idx]] = el
      end
    end
    end
    hash
  end

  def find_question_by_author_id(author_id, values)
    hash = Hash.new
    @db.execute( "select * from questions" ) do |row|
    if row[3] == author_id
      row.each_with_index do |el, idx|
        hash[values[idx]] = el
      end
    end
    end
    hash
  end
  
  def find_reply_by_user_id(user_id, values)
    hash = Hash.new
    @db.execute( "select * from replies" ) do |row|
    if row[5] == user_id
      row.each_with_index do |el, idx|
        hash[values[idx]] = el
      end
    end
    end
    hash
  end

  def find_reply_by_question_id(question_id, values)
    hash = Hash.new
    @db.execute( "select * from replies" ) do |row|
    if row[1] == question_id
      row.each_with_index do |el, idx|
        hash[values[idx]] = el
      end
    end
    end
    hash
  end
  
end



end

class Users
  def initialize(hash)
    @id = hash[id]
    @fname = hash[fname]
    @lname = hash[lname]
  end
  def self.find_by_id(id)

  end

  def self.find_by_name(fname, lname)
    db = QuestionsDatabase.instance
    arr = db.execute(<<-SQL) 
      SELECT *
      FROM users
      WHERE fname = "#{fname}" AND lname = "#{lname}"
    SQL

    return User.new Hash[["id", "fname", "lname"].zip(*arr)]

  end


  def authored_questions(author_id)
    Questions.find_by_author_id(author_id)
  end

  def authored_replies(author_id)
    Replies.find_by_user_id(author_id)
  end

end

class Questions

  def initialize(hash)
    @id = hash[id]
    @title = hash[title]
    @body = hash[body]
    @author = hash[author]
  end

  def self.find_by_author_id(author_id)
    hash = QuestionsDatabase.instance.find_question_by_author_id("questions", author_id, ["id", "title", "body", "author"])
    return Questions.new(hash)

  end

  def self.find_by_id(id)
    hash = QuestionsDatabase.instance.find_by_id("questions", id, ["id", "title", "body", "author"])
    return Questions.new(hash)
  end

  def author(body)

    db = QuestionsDatabase.instance
    arr = db.execute(<<-SQL) 
      SELECT author
      FROM questions
      WHERE body = "#{body}"
    SQL
    return arr[0][0]
  end

  def replies(question_id)
    Reply.find_reply_by_question_id(question_id)
  end

  


end

class QuestionFollows

  def initialize(hash)
    @id = hash[id]
    @user_id = hash[user_id]
    @question_id = hash[question_id]
  end

  def self.find_by_id(id)
    hash = QuestionsDatabase.instance.find_by_id("question_follows", id, ["id", "user_id", "question_id"])
    return QuestionFollows.new(hash)

  end

end

class Replies

  def initialize(hash)
    @id = hash[id]
    @reference_question = hash[reference_question]
    @parent_id = hash[parent_id]
    @body = hash[body]
    @top_reply = hash[top_reply]
  end

  def self.find_by_id(id)
    hash = QuestionsDatabase.instance.find_by_id("replies", id, ["id", "reference_question", "parent_id", "body", "top_reply"])
    return Replies.new(hash)
  end

  def find_by_user_id(user_id)
    hash = QuestionsDatabase.instance.find_reply_by_user_id("replies", user_id, ["id", "reference_question", "parent_id", "body", "top_reply"])
    return Replies.new(hash)
  end

  def author(reply_id)
    db = QuestionsDatabase.instance
    arr = db.execute(<<-SQL) 
      SELECT user_id
      FROM replies
      WHERE id = #{reply_id}
    SQL
    return arr[0]
  end

end

class QuestionLikes

  def initialize(hash)
    @id = hash[id]
    @user_id = hash[user_id]
    @question_liked = hash[question_liked]
  end

  def self.find_by_id(id)
    hash = QuestionsDatabase.instance.find_by_id("replies", id, ["id", "user_id", "question_liked"])
    return QuestionLikes.new(hash)
  end

end