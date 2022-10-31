CREATE TABLE tbl_user(

    account VARCHAR(50)
    , password VARCHAR(150) NOT NULL
    , nickname VARCHAR(5) NOT NULL
    , name VARCHAR(50) NOT NULL
    , email VARCHAR(100) NOT NULL UNIQUE
    , phone_num VARCHAR(20) NOT NULL UNIQUE
    , address VARCHAR(50) NULL
    , birth VARCHAR(10) NOT NULL
    , favorite VARCHAR(20) NOT NULL
    , gender VARCHAR(2) NOT NULL
    , auth VARCHAR(20) DEFAULT 'COMMON'
    , reg_date DATETIME DEFAULT current_timestamp
    , session_id VARCHAR(200) DEFAULT 'none'
    , limit_time DATETIME
    , CONSTRAINT pk_tbl_user PRIMARY KEY(account)

);