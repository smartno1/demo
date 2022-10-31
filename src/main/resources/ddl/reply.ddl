CREATE TABLE tbl_reply (
    reply_no INT(10) AUTO_INCREMENT,
    reply_text VARCHAR(1000) NOT NULL,
    reply_writer VARCHAR(50) NOT NULL,
    reply_date DATETIME default current_timestamp,
    board_no INT(10),
    like_cnt INT(10) default 0,
    account VARCHAR(50),

    CONSTRAINT pk_reply PRIMARY KEY (reply_no),
    CONSTRAINT fk_reply_board
    FOREIGN KEY (board_no)
    REFERENCES tbl_board (board_no) ON DELETE CASCADE,
	CONSTRAINT fk_reply_user
    FOREIGN KEY (account)
    REFERENCES tbl_user (account)ON DELETE CASCADE
);

INSERT INTO tbl_reply (reply_text, reply_writer, board_no, ike_Cnt, account) VALUES("딱복 좋아", "천도복숭아",1,0,"peach");