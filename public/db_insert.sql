INSERT INTO Members (name,email,degree,site,interest,etc)
VALUES ('Scott Uk-Jin Lee','scottlee@hanyang.ac.kr','Professor','https://selab.hanyang.ac.kr/members/TBA',' ','an asst. prof. in the CSE Dept. @ HYU (ERICA)
leading this Laboratory!');
INSERT INTO Members (name,email,degree,site,interest,etc)
VALUES ('Isma Farah','isma2012@hanyang.ac.kr','Ph.D.',' ','Software Engineering','PhD scholar From Pakistan on HEC Scholarship');

INSERT INTO Notice (title,name,uploadtime,contents)
VALUES ('연구원 모집','Scott Uk-Jin Lee','2014-8-29','SELab에서는 소프트웨어공학 전 분야, 멀티쓰레드 소프트웨어 및 웹 기술을 함께 연구할 석사, 박사, 석박통합 및 박사후 과정의 연구원을 모집하고 있습니다.
현재 SELab에서는 미래창조과학부 주체 NIPA주관의 대규모 프로젝트에 활발히 참여하고 있으며 이를 통하여 연구원들의 연구가 원활히 진행될 수 있도록 프로젝트 인건비를 지원하고 있습니다. 이 밖에도 연구조교, 교육조교 장학금 외 다양한 장학금을 지원하고 있으며 입학시 쾌적한 연구공간과 연구 장비 (PC/iMac 등) 지원도 하고 있습니다.
SELab 연구 분야에 관심이 있으신 분은 아래로 연락주세요!
한양대학교 ERICA 제 3공학관 403호, 421호
scottlee@hanyang.ac.kr
031-400-5238 / 031-400-4754');
INSERT INTO Notice (title,name,uploadtime,contents)
VALUES ('2014 PL-SE First Joint Workshop','Scott Uk-Jin Lee','2014-4-29','PLASSE & SE Lab. in the CSE Dept. @ HYU are organizing the 1st Joint Workshop in the Spring of 2014.
2:00pm - 6:00pm, 10th of May, 2014 @ Engineering Building No.3 Room 315');

INSERT INTO Research (subject,subtitle)
VALUES ('Web & Web security','Semantic web');
INSERT INTO Research (subject,subtitle)
VALUES ('Formal Engineering Methods','Formal Specification, Validation, and Verification');

INSERT INTO Publications(category,summary)
VALUES ('International Conference','Zhiqiang Wu, Xin Chen and Scott Uk-Jin Lee,
  "Identifying Latent Android Malware from Applications Description using LSTM," In Proc. International Conference on Information, System and Convergence Applications, 2019, pp.40-42.');
INSERT INTO Publications(category,summary)
VALUES ('International Journal','Isma Farah Siddiqui, Nawab Muhammad Faseeh Qureshi, Muhammad Akram Shaikh, Bhawani Shankar Chowdhry, Asad Abbas, Ali Kashif Bashir and Scott Uk-Jin Lee,
    "Stuck-at Fault Analytics of IoT Devices Using Knowledge-based Data Processing Strategy in Smart Grid," J. Wireless Personal Communications, vol. 2018, pp. 1-15, Apr. 2018.');

INSERT INTO Courses(classcode,subject,course)
VALUES ('CSE107','Undergraduate','Logical Fundamentals of Programming');
INSERT INTO Courses(classcode,subject,course)
VALUES ('CSE117','Undergraduate','Programming Fundamentals');

INSERT INTO nav(id,menu)
VALUES('1','notice');
INSERT INTO nav(id,menu)
VALUES('2','members');
INSERT INTO nav(id,menu)
VALUES('3','research');
INSERT INTO nav(id,menu)
VALUES('4','Publications');
INSERT INTO nav(id,menu)
VALUES('5','course');
INSERT INTO nav(id,menu)
VALUES('6','gallery');
