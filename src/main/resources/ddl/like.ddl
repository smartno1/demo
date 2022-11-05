CREATE table tbl_like(
like_no INT(10) AUTO_INCREMENT,
account VARCHAR(50),
board_no INT(10),
reply_no INT(10),
gallery_no INT(10),
CONSTRAINT pk_tbl_like PRIMARY KEY (like_no),

CONSTRAINT fk_like_board
FOREIGN KEY (board_no)
REFERENCES tbl_board (board_no) ON DELETE CASCADE,
CONSTRAINT fk_like_reply
FOREIGN KEY (reply_no)
REFERENCES tbl_reply (reply_no) ON DELETE CASCADE,
CONSTRAINT fk_like_gallery
FOREIGN KEY (gallery_no)
REFERENCES gallery (gallery_no) ON DELETE CASCADE,
CONSTRAINT fk_like_user
FOREIGN KEY (account)
REFERENCES tbl_user (account)ON DELETE CASCADE
);
