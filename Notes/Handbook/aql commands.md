  
aql> INSERT INTO test.users (PK, username, email, age) VALUES (1, 'john_doe', 'john.doe@example.com', 30)

  
aql> SELECT * FROM test.users WHERE PK=1
  
aql > DELETE from test.users WHERE PK=1