	CREATE DATABASE my_cat CHARACTER SET UTF8MB4;				
	CREATE DATABASE my_board CHARACTER SET UTF8MB4;				
	show databases;	
	show tables;	
    use my_cat;
	use my_board;				
					
	-- 주석임 drop database my_board;		
    drop database board_guest1;
create table board_guest1(
b_no int primary key,
b_content text,
b_writer char(100)
);

insert into board_guest1 values(1,"안녕하세요","ㅇㅇㅇ");
insert into board_guest1 values(2,"aaaaaaaaaaa","ggg");
insert into board_guest1 values(3,"ddddddddddd","sss");

SELECT * FROM board_guest1;
drop database p_member;
create table p_member(
	m_no int primary key auto_increment,
    m_id char(50) not null,
    m_name char(50) not null,
    m_age int,
    m_gender char(20) not null,
    m_tel char(50) not null,
    m_hobby text not null
);
desc p_member;

insert into p_member(m_id,m_name,m_age,m_gender,m_tel,m_hobby)values("addd","손흥민",29,"남","010-1111-1111","축구");
insert into p_member(m_id,m_name,m_age,m_gender,m_tel,m_hobby)values("fdfdf","벤탄쿠르",17,"여","010-2222-2222","농구");
insert into p_member(m_id,m_name,m_age,m_gender,m_tel,m_hobby)values("hhtyh","요리스",23,"남","010-3333-3333","야구");
SELECT * FROM p_member;

drop table p_member;

create table p_member(
	m_no int primary key auto_increment,
    m_id char(50) not null,
    m_name char(50) not null,
    m_age int,
    m_gender char(20) not null,
    m_tel char(50) not null,
    m_hobby text not null
    
);
drop table tottenham_squad;
delete from tottenham_squad;
create table tottenham_squad(					
	id int primary key auto_increment,		#primary key : 테이블에는 한 칼럼에 대해 키(id) 값을 부여할 수 있음. 아이디를 부여하겠다는 선언. 아이디는 중복으로 입력 불가. 그래서 이 값으로 특정 행(레코드) 데이터를 검색 할 수 있게 됨.
			#auto_increment : 이 설정이 추가 된 칼럼(열) 은 다른 칼럼(열)들의 값을 입력하고 이 칼럼은 데이터를 입력하지 않아도 자동으로 1~n 값으로 순서대로 입력 처리 됨.
	p_number int,		
	p_name char(50),		
	p_birth date,	#birth	
	p_position char(20),	#포지션. ex. 공격수 수비수 미드필더 골키퍼	
	p_height int,	# cm	
	p_weight int	#몸무게. kg	
);			
insert into tottenham_squad values(0,7,'손흥민','1992-07-08','공격수',183,78);
insert into tottenham_squad values(0,10,'해리케인','1993-07-28','공격수',188,65);
insert into tottenham_squad values(0,9,'히살리송','1997-05-10','공격수',179,71);
insert into tottenham_squad values(0,14,'이반페리시치','1989-02-02','공격수',186,77);
insert into tottenham_squad values(0,21,'데얀클루셰프스키','2000-04-25','미드필더',186,75);
insert into tottenham_squad values(0,19,'라이언세세뇽','2000-05-18','미드필더',178,70);
insert into tottenham_squad values(0,30,'로드리고벤탄쿠르','1997-06-26','미드필더',187,77);
insert into tottenham_squad values(0,27,'루카스모우라','1992-08-13','미드필더',172,66);
insert into tottenham_squad values(0,11,'브리안 힐 살바티에라','2001-02-11','미드필더',175,60);
insert into tottenham_squad values(0,15,'에릭 다이어','1994-01-15','미드필더',188,90);
insert into tottenham_squad values(0,4,'올리버 스킵','2000-09-16','미드필더',175,70);
insert into tottenham_squad values(0,38,'이브스 비수마','1996-08-30','미드필더',182,72);
insert into tottenham_squad values(0,18,'지오바니 로셀소','1996-04-09','미드필더',177,74);
insert into tottenham_squad values(0,28,'탕귀 은돔벨레','1996-12-28','미드필더',181,76);
insert into tottenham_squad values(0,29,'파페 마타르 사르','2002-09-14','미드필더',184,70);
insert into tottenham_squad values(0,5,'페에르 호이비에르','1995-08-05','미드필더',187,84);
insert into tottenham_squad values(0,8,'해리 윙크스','1996-02-02','미드필더',178,74);
insert into tottenham_squad values(0,6,'다빈손 산체스','1996-06-12','수비수',187,81);
insert into tottenham_squad values(0,24,'디드 스펜스','2000-08-09','수비수',184,80);
insert into tottenham_squad values(0,2,'맷 도허티','1992-01-16','수비수',186,89);
insert into tottenham_squad values(0,33,'벤 데이비스','1993-04-24','수비수',181,76);
insert into tottenham_squad values(0,3,'세르히오 레길론','1996-12-16','수비수',178,70);
insert into tottenham_squad values(0,12,'에메르송','1999-01-14','수비수',181,79);
insert into tottenham_squad values(0,25,'자페 탕가가','1999-03-31','수비수',184,83);
insert into tottenham_squad values(0,17,'크리스티안 로메로','1998-04-27','수비수',185,79);
insert into tottenham_squad values(0,34,'클레망 랑글레','1995-06-17','수비수',186,81);
insert into tottenham_squad values(0,40,'브랜든 오스틴','1999-01-08','골키퍼',188,80);
insert into tottenham_squad values(0,1,'위고 요리스','1986-12-26','골키퍼',188,82);
insert into tottenham_squad values(0,20,'프레이저 포스터','1988-03-17','골키퍼',201,93);
select * from tottenham_squad;
select * from tottenham_squad where p_position = '공격수';
delete from tottenham_squad where p_number = 7;
update tottenham_squad set p_name = '밴탄쿠르' where p_number=30;
select * from tottenham_squad where p_number >= 7;
select * from tottenham_squad where p_number >= 6 and p_name like '%손%';
select * from tottenham_squad order by p_number;
select * from tottenham_squad order by p_number asc;
select * from tottenham_squad order by p_number desc;
ALTER TABLE tottenham_squad ADD weeklypay char(100);
update tottenham_squad set weeklypay = 222222 where p_number = 7;
update tottenham_squad set weeklypay = 123123 where p_number = 6;

create table EPL_Ranking(
	EPL_no int primary key auto_increment, #아이디선언	
    EPL_teamname char(50) not null,#팀명	
    EPL_numberOfGame int not null,#게임수	
    EPL_win int not null,#승	
    EPL_draw int not null,#무승부	
    EPL_defeat int not null,#패	
    EPL_goal int not null,#득점	
    EPL_goalloss int not null,#실점	
    EPL_GD int,#득실차	
    EPL_point int not null #승점	
);
							#아이디 팀명  게임수 승 무승부 패 득점 실점 득실차 승점
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "토트넘",1,  1 ,0,  0,  4, 1,     3);
insert into EPL_Ranking(EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "본머스",1,  1 ,0,  0,  2, 0,     3);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "아스널",1,  1 ,0,  0,  2, 0,     3);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "맨 시티",1,  1 ,0,  0,  2, 0,     3);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "뉴캐슬",1,  1 ,0,  0,  2, 0,     3);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "브라이턴",1,  1 ,0,  0,  2, 1,     3);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "리즈 유나이티드",1,  1 ,0,  0,  2, 1,     3);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "첼시",1,  1 ,0,  0,  1, 0,     3);

insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "브렌트퍼드",1,  0 ,1,  0,  2, 2,     1);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "풀럼",1,  0 ,1,  0,  2, 2,     1);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "레스터 시티",1,  0 ,1,  0,  2, 2,     1);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "리버풀",1,  0 ,1,  0,  2, 2,     1);

insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point
)values(0, "맨유",1,  0 ,0,  1,  1, 2,     0);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "울브스",1,  0 ,0,  1,  1, 2,     0);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "에버턴",1,  0 ,0,  1,  0, 1,     0);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "애스턴 빌라",1,  0 ,0,  1,  0, 2,     0);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "크리스털 팰리스",1,  0 ,0,  1,  0, 2,     0);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "노팅엄 포리스트",1,  0 ,0,  1,  0, 2,     0);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "웨스트 햄",1,  0 ,0,  1,  0, 2,     0);
insert into EPL_Ranking (EPL_no,EPL_teamname,EPL_numberOfGame,EPL_win,EPL_draw,EPL_defeat,EPL_goal,EPL_goalloss,EPL_point)
values(0, "사우샘프턴",1,  0 ,0,  1,  1, 4,     0);

alter table EPL_Ranking rename column EPL_teamname to 팀명;
alter table EPL_Ranking rename column EPL_numberOfGame to 경기수;
alter table EPL_Ranking rename column EPL_win to 승;
alter table EPL_Ranking rename column EPL_draw to 무;
alter table EPL_Ranking rename column EPL_defeat to 패;
alter table EPL_Ranking rename column EPL_goal to 득점;
alter table EPL_Ranking rename column EPL_goalloss to 실점;
alter table EPL_Ranking rename column EPL_GD to 득실차;
alter table EPL_Ranking rename column EPL_point to 승점;
select * from EPL_Ranking ;
update EPL_Ranking set 득실차 = 득점-실점;
alter table EPL_Ranking add 구단명 char(100);
UPDATE EPL_Ranking SET 구단명 = "닭집" WHERE EPL_no = 1;
UPDATE EPL_Ranking SET 구단명 = "람머스네" WHERE EPL_no = 2;
UPDATE EPL_Ranking SET 구단명 = "doghouse" WHERE EPL_no = 3;
UPDATE EPL_Ranking SET 구단명 = "홀란드네" WHERE EPL_no = 4;
UPDATE EPL_Ranking SET 구단명 = "새로운 요새" WHERE EPL_no = 5;
UPDATE EPL_Ranking SET 구단명 = "갈매기집" WHERE EPL_no = 6;
UPDATE EPL_Ranking SET 구단명 = "리즈시절" WHERE EPL_no = 7;
UPDATE EPL_Ranking SET 구단명 = "(구)삼성" WHERE EPL_no = 8;
UPDATE EPL_Ranking SET 구단명 = "벌집" WHERE EPL_no = 9;
UPDATE EPL_Ranking SET 구단명 = "설기현 전직장" WHERE EPL_no = 10;
UPDATE EPL_Ranking SET 구단명 = "여우네" WHERE EPL_no = 11;
UPDATE EPL_Ranking SET 구단명 = "이제 내 빈자리가 느껴지지 않는거야?" WHERE EPL_no = 12;
UPDATE EPL_Ranking SET 구단명 = "맹구" WHERE EPL_no = 13;
UPDATE EPL_Ranking SET 구단명 = "늑대들" WHERE EPL_no = 14;
UPDATE EPL_Ranking SET 구단명 = "1부쿼터제" WHERE EPL_no = 15;
UPDATE EPL_Ranking SET 구단명 = "그래 그거면 된거야..." WHERE EPL_no = 16;
UPDATE EPL_Ranking SET 구단명 = "수정궁" WHERE EPL_no = 17;
UPDATE EPL_Ranking SET 구단명 = "노팅힐" WHERE EPL_no = 18;
UPDATE EPL_Ranking SET 구단명 = "동쪽 햄" WHERE EPL_no = 19;
UPDATE EPL_Ranking SET 구단명 = "남쪽나무" WHERE EPL_no = 20;

drop table EPL_Ranking;
delete from EPL_Ranking;


drop table EPL_GOALRanking;
delete from EPL_GOALRanking;
create table EPL_GOALRanking(
	Player_no int primary key auto_increment, #아이디선언	
    선수이름 text not null,
    소속팀 text not null,
    득점수 int not null
);
insert into EPL_GOALRanking (Player_no,선수이름,소속팀,득점수)values(0,"알렉산다르 미트로비치","리버풀",2);
insert into EPL_GOALRanking (Player_no,선수이름,소속팀,득점수)values(0,"엘링 홀란드","맨 시티",2);
insert into EPL_GOALRanking (Player_no,선수이름,소속팀,득점수)values(0,"파스칼 그로스","브라이턴",2);
insert into EPL_GOALRanking (Player_no,선수이름,소속팀,득점수)values(0,"가브리엘 마르티넬리","아스널",1);
insert into EPL_GOALRanking (Player_no,선수이름,소속팀,득점수)values(0,"다니엘 포덴세","울브스",1);
insert into EPL_GOALRanking (Player_no,선수이름,소속팀,득점수)values(0,"다윈 누녜스","리버풀",1);

select * from EPL_GOALRanking;


drop table EPL_ASSISTRanking;
delete from EPL_ASSISTRanking;
create table EPL_ASSISTRanking(
	Player_no int primary key auto_increment, #아이디선언	
    선수이름 char(100) not null,
    소속팀 char(100) not null,
    어시스트수 int not null

);
insert into EPL_ASSISTRanking (Player_no,선수이름,소속팀,어시스트수)values(0,"다윈 누녜스","리버풀",1);
insert into EPL_ASSISTRanking (Player_no,선수이름,소속팀,어시스트수)values(0,"대니 웰벡","브라이턴",1);
insert into EPL_ASSISTRanking (Player_no,선수이름,소속팀,어시스트수)values(0,"데얀 쿨루셰프스키","토트넘",1);
insert into EPL_ASSISTRanking (Player_no,선수이름,소속팀,어시스트수)values(0,"로이드 켈리","본머스",1);
insert into EPL_ASSISTRanking (Player_no,선수이름,소속팀,어시스트수)values(0,"리코 헨리","브렌트퍼드",1);
insert into EPL_ASSISTRanking (Player_no,선수이름,소속팀,어시스트수)values(0,"모하메드 살라","리버풀",1);

select * from EPL_ASSISTRanking;

UPDATE EPL_ASSISTRanking SET 선수이름 = "손흥민" WHERE Player_no = 6;
UPDATE EPL_ASSISTRanking SET 선수이름 = "황희찬" WHERE Player_no = 2;


drop table LCK_Ranking;
delete from LCK_Ranking;
create table LCK_Ranking(
	LCK_no int primary key auto_increment, #아이디선언	
    LCK_name char(50) not null,#팀명	
    LCK_win int not null,#승	
    LCK_defeat int not null,#패	
    LCK_GD int not null,#득실차	
    LCK_winrate decimal(10,2),#승률	
    LCK_KDA decimal(10,2),#KDA	
    LCK_Kill int not null, #킬	
    LCK_death int not null, #데스	
	LCK_assist int not null #어시
);
insert into LCK_Ranking (LCK_no,LCK_name,LCK_win,LCK_defeat,LCK_GD,LCK_Kill,LCK_death,LCK_assist)
values(0,"젠지",17,1,30,564,315,1291);
insert into LCK_Ranking (LCK_no,LCK_name,LCK_win,LCK_defeat,LCK_GD,LCK_Kill,LCK_death,LCK_assist)
values(0,"T1",15,3,18,544,458,1340);
insert into LCK_Ranking (LCK_no,LCK_name,LCK_win,LCK_defeat,LCK_GD,LCK_Kill,LCK_death,LCK_assist)
values(0,"리브 샌박",13,5,13,554,426,1391);
insert into LCK_Ranking (LCK_no,LCK_name,LCK_win,LCK_defeat,LCK_GD,LCK_Kill,LCK_death,LCK_assist)
values(0,"담원 기아",10,8,7,501,409,1241);
insert into LCK_Ranking (LCK_no,LCK_name,LCK_win,LCK_defeat,LCK_GD,LCK_Kill,LCK_death,LCK_assist)
values(0,"KT",10,8,5,555,462,1392);
insert into LCK_Ranking (LCK_no,LCK_name,LCK_win,LCK_defeat,LCK_GD,LCK_Kill,LCK_death,LCK_assist)
values(0,"DRX",9,9,-1,532,559,1330);
insert into LCK_Ranking (LCK_no,LCK_name,LCK_win,LCK_defeat,LCK_GD,LCK_Kill,LCK_death,LCK_assist)
values(0,"광동",6,12,-16,374,495,948);
insert into LCK_Ranking (LCK_no,LCK_name,LCK_win,LCK_defeat,LCK_GD,LCK_Kill,LCK_death,LCK_assist)
values(0,"농심",5,13,-14,461,532,1122);
insert into LCK_Ranking (LCK_no,LCK_name,LCK_win,LCK_defeat,LCK_GD,LCK_Kill,LCK_death,LCK_assist)
values(0,"프레딧",3,15,-20,360,511,879);
insert into LCK_Ranking (LCK_no,LCK_name,LCK_win,LCK_defeat,LCK_GD,LCK_Kill,LCK_death,LCK_assist)
values(0,"한화생명",2,16,-22,342,629,804);

select * from LCK_Ranking;

alter table LCK_Ranking rename column LCK_name to 팀명;
alter table LCK_Ranking rename column LCK_win to 승	;
alter table LCK_Ranking rename column LCK_defeat to 패;
alter table LCK_Ranking rename column LCK_GD to 득실차;
alter table LCK_Ranking rename column LCK_winrate to 승률;
alter table LCK_Ranking rename column LCK_KDA to KDA;
alter table LCK_Ranking rename column LCK_Kill to 킬;
alter table LCK_Ranking rename column LCK_death to 데스;
alter table LCK_Ranking rename column LCK_assist to 어시;

update LCK_Ranking set 승률 = (승/(승+패)*100);
update LCK_Ranking set KDA = ((킬+어시)/데스);
select * from LCK_Ranking where LCK_no <=6;
select * from LCK_Ranking where LCK_name like '리브 샌박';
select * from LCK_Ranking where LCK_name like '%T%';
SELECT * FROM LCK_Ranking WHERE LCK_winrate IS NULL;
SELECT * FROM LCK_Ranking WHERE LCK_winrate IS NOT NULL;
select * from LCK_Ranking where LCK_name like '%T%' and LCK_no < 4;
UPDATE LCK_Ranking SET LCK_name  = '젠지이스포츠' WHERE LCK_no = 1;
select * from LCK_Ranking where LCK_no <=1;
DELETE FROM LCK_Ranking WHERE LCK_name = '젠지이스포츠';

