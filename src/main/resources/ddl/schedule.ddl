CREATE table calender(
id INT(10) AUTO_INCREMENT,
account VARCHAR(50),
title VARCHAR(150),
content VARCHAR(500),
start VARCHAR(50),
end VARCHAR(50),
all_day TINYINT(4),
background_color VARCHAR(50),
text_color VARCHAR(50),
border_color VARCHAR(50),

CONSTRAINT pk_calendar PRIMARY KEY (no),

CONSTRAINT fk_calender_user
FOREIGN KEY (account)
REFERENCES tbl_user (account)ON DELETE CASCADE
);
