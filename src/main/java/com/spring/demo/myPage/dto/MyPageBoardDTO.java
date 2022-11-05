package com.spring.demo.myPage.dto;

import com.spring.demo.board.domain.Board;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MyPageBoardDTO extends Board {


    private int boardReplyCnt;

}
