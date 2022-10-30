package com.spring.demo.reply.service;

import com.spring.demo.common.paging.Page;
import com.spring.demo.common.paging.PageMaker;
import com.spring.demo.reply.domain.Reply;
import com.spring.demo.reply.repository.ReplyMapper;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@RequiredArgsConstructor
public class ReplyService {



    private final ReplyMapper replyMapper;

    //댓글 목록 조회
    public Map<String, Object> getList(Long boardNo, Page page) {
        PageMaker maker
                = new PageMaker(page, getCount(boardNo));

        Map<String, Object> replyMap = new HashMap<>();
        replyMap.put("replyList", replyMapper.findAll(boardNo, page));
        replyMap.put("maker", maker);
        replyMap.put("count", replyMapper.getReplyCount(boardNo));

        return replyMap;
    }
    //댓글 총 개수 조회
    public int getCount(Long boardNo) {
        return replyMapper.getReplyCount(boardNo);
    }
    //댓글 개별 조회
    public Reply get(Long replyNo) {
        return replyMapper.findOne(replyNo);
    }

    //댓글 쓰기 중간처리
    public boolean write(Reply reply) {
        return replyMapper.save(reply);
    }

    //댓글 수정 중간처리
    public boolean modify(Reply reply) {
        return replyMapper.modify(reply);
    }
    //댓글 삭제 중간처리
    public boolean remove(Long replyNo) {
        return replyMapper.remove(replyNo);
    }

    public String[] getLikeList(Long replyNo){

      String likeText = replyMapper.findReplyLike(replyNo);


      if(likeText==null||likeText=="")return null;
      String[] LikeList = likeText.split("%");

      return LikeList;


    };

    public int getCnt(String[] likeList){


        int likeCnt = likeList.length;

        return likeCnt;

    };


    public int updateLikeCnt(Reply reply){

        String account = reply.getAccount();
        Long replyNo = reply.getReplyNo()
        String[] likeList = getLikeList(replyNo);

        int likeCnt = 0;

        if(!(likeList.length==0)) {
            for (String user : likeList) {

                if (user.equals(account)) {

                    String[] newList = likeList.del;
                    String replyLike = newList.toString();
                    reply.get
                    replyMapper.modifyReplyLike(replyNo,new)



                }
                return likeCnt;

            }

            클릭-> 좋아요배열 + replyNo ->

            if not null{
                for{
                    배열에 계정 있는지 확인 -> 있으면 string 가져와서
                    배열 변환 -> 계정 삭제 ->string 변환 -> 저장
                            +배열 반환

                }
            }
            좋아요 가져와서 추가 후 저장
                    + 배열 반환

        }

        addLike;

        return likeCnt;
    };

}


