
create table tbl_cart(
    cart_id  int auto_increment primary key,
    account varchar(50),
    goods_id int,
    goods_cnt int,
    foreign key (account) references tbl_user(account),
    //foreign key (goods_id) references tbl_goods(goods_id)
);

alter table tbl_cart add unique (account, goods_id);


