package com.spring.demo.member.dto;

import lombok.*;

@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class KaKaoUserInfoDTO {

    private String nickName;
    private String profileImg;
    private String email;
    private String gender;

    public KaKaoUserInfoDTO(String nickName, String profileImg, String email) {
        this.nickName = nickName;
        this.profileImg = profileImg;
        this.email = email;
        this.gender=null;
    }


}
