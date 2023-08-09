
-- drop table t_clinic;
-- drop table t_group_post;
-- drop table t_deep;
-- drop table t_upload;
-- drop table t_post;
-- drop table t_share;
-- drop table t_calendar;
-- drop table t_invitation;
-- drop table t_group;
-- drop table t_member;

insert into t_member(id, pw, nick, admin_yn, joindate) values('user01', '1234', '하이', 'N', now());
select * from t_member;
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- t_member Table Create SQL
-- 테이블 생성 SQL - t_member
CREATE TABLE t_member
(
     id          VARCHAR(50)    NOT NULL    COMMENT '아이디. 이메일', 
     pw          VARCHAR(30)    NOT NULL    COMMENT '비밀번호. 비밀번호', 
     nick        VARCHAR(50)    NOT NULL    COMMENT '별명. 별명', 
     admin_yn    CHAR(1)        NOT NULL    COMMENT '관리자여부. 관리자여부', 
     joindate    DATETIME       NOT NULL    COMMENT '가입일자. 가입일자', 
     group_seq   INT            NULL        COMMENT '그룹순번. 그룹순번', 
     PRIMARY KEY (id)
);

-- 테이블 Comment 설정 SQL - t_member
ALTER TABLE t_member COMMENT '회원. 회원';


-- t_upload Table Create SQL
-- 테이블 생성 SQL - t_upload
CREATE TABLE t_upload
(
     upload_seq    INT             NOT NULL    AUTO_INCREMENT COMMENT '업로드 순번. 업로드 순번', 
     id            VARCHAR(50)     NOT NULL    COMMENT '작성자 아이디. 작성자 이메일', 
     upload_file   VARCHAR(600)    NOT NULL    COMMENT '업로드 파일. 업로드 파일', 
     upload_at     DATETIME        NOT NULL    COMMENT '업로드 날짜. 업로드 날짜', 
     PRIMARY KEY (upload_seq)
);

-- 테이블 Comment 설정 SQL - t_upload
ALTER TABLE t_upload COMMENT '파일 업로드. 파일 업로드';

-- Foreign Key 설정 SQL - t_upload(id) -> t_member(id)
ALTER TABLE t_upload
    ADD CONSTRAINT FK_t_upload_id_t_member_id FOREIGN KEY (id)
        REFERENCES t_member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_upload(id)
-- ALTER TABLE t_upload
-- DROP FOREIGN KEY FK_t_upload_id_t_member_id;


-- t_group Table Create SQL
-- 테이블 생성 SQL - t_group
CREATE TABLE t_group
(
     group_seq    INT             NOT NULL    AUTO_INCREMENT COMMENT '그룹 순번. 그룹 순번', 
     group_name   VARCHAR(100)    NOT NULL    COMMENT '그룹 명. 그룹 명', 
     id           VARCHAR(50)     NOT NULL    COMMENT '그룹 생성자. 그룹 생성자', 
     PRIMARY KEY (group_seq)
);

-- 테이블 Comment 설정 SQL - t_group
ALTER TABLE t_group COMMENT '그룹. 그룹';


-- t_calendar Table Create SQL
-- 테이블 생성 SQL - t_calendar
CREATE TABLE t_calendar
(
     sche_seq      INT             NOT NULL    AUTO_INCREMENT COMMENT '일정 순번. 일정 순번', 
     sche_name     VARCHAR(100)    NOT NULL    COMMENT '일정명. 일정명', 
     start_at      DATETIME        NOT NULL    COMMENT '시작날짜. 시작날짜', 
     end_at        DATETIME        NOT NULL    COMMENT '종료날짜. 종료날짜', 
     id            VARCHAR(50)     NOT NULL    COMMENT '작성자 아이디. 작성자 이메일', 
     sche_detail   TEXT            NOT NULL    COMMENT '일정 세부사항. 일정 세부사항', 
     PRIMARY KEY (sche_seq)
);

-- 테이블 Comment 설정 SQL - t_calendar
ALTER TABLE t_calendar COMMENT '캘린더. 캘린더';

-- Foreign Key 설정 SQL - t_calendar(id) -> t_member(id)
ALTER TABLE t_calendar
    ADD CONSTRAINT FK_t_calendar_id_t_member_id FOREIGN KEY (id)
        REFERENCES t_member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_calendar(id)
-- ALTER TABLE t_calendar
-- DROP FOREIGN KEY FK_t_calendar_id_t_member_id;


-- t_share Table Create SQL
-- 테이블 생성 SQL - t_share
CREATE TABLE t_share
(
     share_seq   INT    NOT NULL    AUTO_INCREMENT COMMENT '공유 순번. 공유 순번', 
     sche_seq    INT    NOT NULL    COMMENT '일정 순번. 일정 순번', 
     group_seq   INT    NOT NULL    COMMENT '그룹 순번. 그룹 순번', 
     PRIMARY KEY (share_seq)
);

-- 테이블 Comment 설정 SQL - t_share
ALTER TABLE t_share COMMENT '일정공유. 일정공유';

-- Foreign Key 설정 SQL - t_share(group_seq) -> t_group(group_seq)
ALTER TABLE t_share
    ADD CONSTRAINT FK_t_share_group_seq_t_group_group_seq FOREIGN KEY (group_seq)
        REFERENCES t_group (group_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_share(group_seq)
-- ALTER TABLE t_share
-- DROP FOREIGN KEY FK_t_share_group_seq_t_group_group_seq;

-- Foreign Key 설정 SQL - t_share(sche_seq) -> t_calendar(sche_seq)
ALTER TABLE t_share
    ADD CONSTRAINT FK_t_share_sche_seq_t_calendar_sche_seq FOREIGN KEY (sche_seq)
        REFERENCES t_calendar (sche_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_share(sche_seq)
-- ALTER TABLE t_share
-- DROP FOREIGN KEY FK_t_share_sche_seq_t_calendar_sche_seq;


-- t_clinic Table Create SQL
-- 테이블 생성 SQL - t_clinic
CREATE TABLE t_clinic
(
     clinic_seq    INT                NOT NULL    AUTO_INCREMENT COMMENT '병원 순번. 병원 순번', 
     clinic_name   VARCHAR(100)       NOT NULL    COMMENT '병원 명. 병원 명', 
     clinic_tel    VARCHAR(20)        NOT NULL    COMMENT '병원 연락처. 병원 연락처', 
     clinic_addr   VARCHAR(600)       NOT NULL    COMMENT '병원 주소. 병원 주소', 
     lat           DECIMAL(17, 14)    NOT NULL    COMMENT '위도. 위도', 
     lng           DECIMAL(17, 14)    NOT NULL    COMMENT '경도. 경도', 
     PRIMARY KEY (clinic_seq)
);

-- 테이블 Comment 설정 SQL - t_clinic
ALTER TABLE t_clinic COMMENT '병원 정보';


-- t_deep Table Create SQL
-- 테이블 생성 SQL - t_deep
CREATE TABLE t_deep
(
     deep_seq      INT             NOT NULL    AUTO_INCREMENT COMMENT '분석 순번. 분석 순번', 
     upload_seq    INT             NOT NULL    COMMENT '업로드 순번. 업로드 순번', 
     deep_result   TEXT            NOT NULL    COMMENT '분석 결과. 분석 결과', 
     deep_img      VARCHAR(600)    NOT NULL    COMMENT '분석 이미지. 분석 이미지', 
     created_at    DATETIME        NOT NULL    COMMENT '분석 날짜. 분석 날짜', 
     PRIMARY KEY (deep_seq)
);

-- 테이블 Comment 설정 SQL - t_deep
ALTER TABLE t_deep COMMENT '딥러닝 분석 결과. 딥러닝 분석 결과';

-- Foreign Key 설정 SQL - t_deep(upload_seq) -> t_upload(upload_seq)
ALTER TABLE t_deep
    ADD CONSTRAINT FK_t_deep_upload_seq_t_upload_upload_seq FOREIGN KEY (upload_seq)
        REFERENCES t_upload (upload_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_deep(upload_seq)
-- ALTER TABLE t_deep
-- DROP FOREIGN KEY FK_t_deep_upload_seq_t_upload_upload_seq;


-- t_post Table Create SQL
-- 테이블 생성 SQL - t_post
CREATE TABLE t_post
(
     post_idx       INT             NOT NULL    AUTO_INCREMENT COMMENT '글 순번. 글 순번', 
     post_title     VARCHAR(800)    NOT NULL    COMMENT '글 제목. 글 제목', 
     post_content   TEXT            NULL        COMMENT '글 내용. 글 내용', 
     post_file      VARCHAR(600)    NULL        COMMENT '글 첨부파일. 글 첨부파일', 
     created_at     DATETIME        NOT NULL    COMMENT '글 작성일자. 글 작성일자', 
     post_views     INT             NOT NULL    COMMENT '글 조회수. 글 조회수', 
     post_likes     INT             NOT NULL    COMMENT '글 좋아요수. 글 좋아요수', 
     id             VARCHAR(50)     NOT NULL    COMMENT '작성자 아이디. 작성자 이메일', 
     PRIMARY KEY (post_idx)
);

-- 테이블 Comment 설정 SQL - t_post
ALTER TABLE t_post COMMENT '게시판. 게시판';

-- Foreign Key 설정 SQL - t_post(id) -> t_member(id)
ALTER TABLE t_post
    ADD CONSTRAINT FK_t_post_id_t_member_id FOREIGN KEY (id)
        REFERENCES t_member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_post(id)
-- ALTER TABLE t_post
-- DROP FOREIGN KEY FK_t_post_id_t_member_id;


-- t_invitation Table Create SQL
-- 테이블 생성 SQL - t_invitation
CREATE TABLE t_invitation
(
     invt_seq    INT            NOT NULL    AUTO_INCREMENT COMMENT '초대 순번. 초대 순번', 
     id          VARCHAR(50)    NOT NULL    COMMENT '초대 아이디. 초대 아이디', 
     invt_id     VARCHAR(50)    NOT NULL    COMMENT '초대 상대방 아이디. 초대 상대방 아이디', 
     invt_yn     CHAR(1)        NOT NULL    COMMENT '처리 여부. 처리 여부', 
     group_seq   INT            NOT NULL    COMMENT '그룹 순번. 그룹 순번', 
     PRIMARY KEY (invt_seq)
);

-- 테이블 Comment 설정 SQL - t_invitation
ALTER TABLE t_invitation COMMENT '아이디 초대. 아이디 초대';

-- Foreign Key 설정 SQL - t_invitation(group_seq) -> t_group(group_seq)
ALTER TABLE t_invitation
    ADD CONSTRAINT FK_t_invitation_group_seq_t_group_group_seq FOREIGN KEY (group_seq)
        REFERENCES t_group (group_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_invitation(group_seq)
-- ALTER TABLE t_invitation
-- DROP FOREIGN KEY FK_t_invitation_group_seq_t_group_group_seq;


-- t_group_post Table Create SQL
-- 테이블 생성 SQL - t_group_post
CREATE TABLE t_group_post
(
     post_idx       INT             NOT NULL    AUTO_INCREMENT COMMENT '글 순번. 글 순번', 
     post_title     VARCHAR(800)    NOT NULL    COMMENT '글 제목. 글 제목', 
     post_content   TEXT            NULL        COMMENT '글 내용. 글 내용', 
     post_file      VARCHAR(600)    NULL        COMMENT '글 첨부파일. 글 첨부파일', 
     created_at     DATETIME        NOT NULL    COMMENT '글 작성일자. 글 작성일자', 
     post_views     INT             NOT NULL    COMMENT '글 조회수. 글 조회수', 
     post_likes     INT             NOT NULL    COMMENT '글 좋아요수. 글 좋아요수', 
     id             VARCHAR(50)     NOT NULL    COMMENT '작성자 아이디. 작성자 이메일', 
     group_seq      INT             NOT NULL    COMMENT '그룹 순번. 그룹 순번', 
     PRIMARY KEY (post_idx)
);

-- 테이블 Comment 설정 SQL - t_group_post
ALTER TABLE t_group_post COMMENT '그룹 게시판. 그룹 게시판';

-- Foreign Key 설정 SQL - t_group_post(group_seq) -> t_group(group_seq)
ALTER TABLE t_group_post
    ADD CONSTRAINT FK_t_group_post_group_seq_t_group_group_seq FOREIGN KEY (group_seq)
        REFERENCES t_group (group_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_group_post(group_seq)
-- ALTER TABLE t_group_post
-- DROP FOREIGN KEY FK_t_group_post_group_seq_t_group_group_seq;

-- Foreign Key 설정 SQL - t_group_post(id) -> t_member(id)
ALTER TABLE t_group_post
    ADD CONSTRAINT FK_t_group_post_id_t_member_id FOREIGN KEY (id)
        REFERENCES t_member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_group_post(id)
-- ALTER TABLE t_group_post
-- DROP FOREIGN KEY FK_t_group_post_id_t_member_id;
