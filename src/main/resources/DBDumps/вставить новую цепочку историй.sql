INSERT INTO histories (submitdate, customerid, invoiceid, stepid) 
VALUES 
(current_timestamp, 1, 1554, 1),
(current_timestamp, 17, 1554, 2),
(current_timestamp, 17, 1554, 3),
(current_timestamp, 16, 1554, 4),
(current_timestamp, 16, 1554, 8),
(current_timestamp, 1, 1554, 9),
(current_timestamp, 18, 1554, 10),
(current_timestamp, 18, 1554, 11),
(current_timestamp, 18, 1554, 12),
(current_timestamp, 18, 1554, 13);

INSERT INTO stepcomments (customerid, comment, historyid, submitdate) 
VALUES 
(1, 'comment test1', 1, current_timestamp),
(17, 'comment test2', 1, current_timestamp),
(1, 'comment test3', 1, current_timestamp),
(17, 'comment test4', 2, current_timestamp),
(18, 'comment test5', 3, current_timestamp),
(16, 'comment test6', 4, current_timestamp),
(17, 'comment test7', 5, current_timestamp),
(17, 'comment test8', 6, current_timestamp),
(17, 'comment test9', 7, current_timestamp),
(16, 'comment test10', 8, current_timestamp),
(16, 'comment test11', 9, current_timestamp),
(17, 'comment test12', 10, current_timestamp);