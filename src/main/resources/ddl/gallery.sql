CREATE TABLE gallery(

    account VARCHAR(50)
    , gallery_no INT NOT NULL AUTO_INCREMENT
    , src VARCHAR(150) NOT NULL
    , nickname VARCHAR(5) NOT NULL
    , text VARCHAR(500) NOT NULL
    , reg_date DATETIME DEFAULT current_timestamp
    , like_cnt INT NOT NULL DEFAULT 0
    , CONSTRAINT pk_gallery PRIMARY KEY(gallery_no)

);
