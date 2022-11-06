CREATE table calender(
no INT(10) AUTO_INCREMENT,
account VARCHAR(50),
title varchar(150),
content varchar(500),
start varchar(50),
end varchar(50),
CONSTRAINT pk_calendar PRIMARY KEY (no),

CONSTRAINT fk_calender_user
FOREIGN KEY (account)
REFERENCES tbl_user (account)ON DELETE CASCADE
);
