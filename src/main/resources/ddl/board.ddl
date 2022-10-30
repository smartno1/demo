CREATE TABLE tbl_board (
    board_no INT(10) AUTO_INCREMENT,
    writer VARCHAR(20) NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    view_cnt INT(10) DEFAULT 0,
    account VARCHAR(50),
    reg_date DATETIME DEFAULT current_timestamp,
    CONSTRAINT pk_tbl_board PRIMARY KEY (board_no),
    board_like TEXT

);
