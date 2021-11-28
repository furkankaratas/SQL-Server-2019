USE AdventureWorks2019
GO

-- Create Node Table

CREATE TABLE NodeTable(
    ID INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Age INTEGER
    ) AS NODE;

-- Insert Row to Node Table

INSERT INTO NodeTable
VALUES (1,'Alex De Souza',40)

-- List rows

SELECT * FROM NodeTable

-- Create Node Table

CREATE TABLE NodeTable2(
    TeamID INTEGER PRIMARY KEY,
    TeamName VARCHAR(500),
    Country VARCHAR(100)
) AS NODE 

-- Insert Row to Node Table

INSERT INTO NodeTable2
VALUES (1,'FENERBAHCE','TURKEY')

-- Create Edge Table

CREATE TABLE EdgeTable (
    CONSTRAINT EC_EdgeTable CONNECTION (NodeTable TO NodeTable2)
)
AS EDGE 

-- Insert Node Table

INSERT INTO EdgeTable ($from_id, $to_id)
VALUES (
( SELECT $node_id from NodeTable WHERE ID=1),
( SELECT $node_id from NodeTable2 WHERE TeamID=1))

-- List Row

SELECT * FROM EdgeTable