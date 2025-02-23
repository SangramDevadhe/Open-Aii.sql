-- 1. Users Table (Stores chatbot users)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert records into Users table
INSERT INTO Users (username, email) VALUES
('user1', 'user1@example.com'),
('user2', 'user2@example.com'),
('user3', 'user3@example.com'),
('user4', 'user4@example.com'),
('user5', 'user5@example.com');

-- 2. Conversations Table (Logs chatbot-user conversations)
CREATE TABLE Conversations (
    conversation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert records into Conversations table
INSERT INTO Conversations (user_id) VALUES
(1),
(2),
(3),
(4),
(5);

-- 3. Messages Table (Stores individual messages in a conversation)
CREATE TABLE Messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    conversation_id INT,
    sender VARCHAR(50) NOT NULL,
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conversation_id) REFERENCES Conversations(conversation_id)
);

-- Insert records into Messages table
INSERT INTO Messages (conversation_id, sender, message_text) VALUES
(1, 'user1', 'Hello, how can I help you?'),
(2, 'user2', 'What is the weather today?'),
(3, 'user3', 'Tell me a joke.'),
(4, 'user4', 'What is the capital of France?'),
(5, 'user5', 'How do I reset my password?');

-- 4. Query Patterns Table (Stores frequently asked queries for analysis)
CREATE TABLE QueryPatterns (
    pattern_id INT AUTO_INCREMENT PRIMARY KEY,
    query_text TEXT NOT NULL,
    frequency INT DEFAULT 1
);

-- Insert records into QueryPatterns table
INSERT INTO QueryPatterns (query_text, frequency) VALUES
('How can I help you?', 10),
('What is the weather today?', 8),
('Tell me a joke.', 5),
('What is the capital of France?', 7),
('How do I reset my password?', 6);

-- 5. Chatbot Responses Table (Stores chatbot responses for training)
CREATE TABLE ChatbotResponses (
    response_id INT AUTO_INCREMENT PRIMARY KEY,
    response_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert records into ChatbotResponses table
INSERT INTO ChatbotResponses (response_text) VALUES
('I am here to help you.'),
('The weather today is sunny.'),
('Why did the chicken cross the road? To get to the other side!'),
('The capital of France is Paris.'),
('To reset your password, go to the settings page.');

-- 6. AI Model Integration Table (Tracks AI model versions & updates)
CREATE TABLE AIModelIntegration (
    model_id INT AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    version VARCHAR(50) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert records into AIModelIntegration table
INSERT INTO AIModelIntegration (model_name, version) VALUES
('GPT-3', '3.0'),
('GPT-3.5', '3.5'),
('GPT-4', '4.0'),
('BERT', '1.0'),
('T5', '1.1');
