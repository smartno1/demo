
CREATE TABLE tbl_board (
    board_no INT(10) AUTO_INCREMENT,
    writer VARCHAR(20) NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    like_cnt INT(10)  DEFAULT 0,
    view_cnt INT(10) DEFAULT 0,
    account VARCHAR(50),
    reg_date DATETIME DEFAULT current_timestamp,

    CONSTRAINT pk_tbl_board PRIMARY KEY (board_no),
	CONSTRAINT fk_board_user
    FOREIGN KEY (account)
    REFERENCES tbl_user (account) ON DELETE CASCADE

);

INSERT INTO tbl_board (writer, title, content, like_Cnt,  account) values ("천도복숭아", "복숭아 만세","복숭아는 맛있다",0,"peach");
