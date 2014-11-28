CREATE TABLE dimGender (
  value string,
  name string
);

insert into dimgender select '1', '男';
insert into table dimgender values ('2', '女');

create TABLE factUserInfo (
  userId string,
  name string,
  gender string
);

INSERT INTO factUserInfo VALUES ('1000', 'y1', '1');
INSERT INTO factUserInfo VALUES ('1001', 'y2', '1');
INSERT INTO factUserInfo VALUES ('1002', 'y3', '1');
INSERT INTO factUserInfo VALUES ('1003', 'y4', '1');
INSERT INTO factUserInfo VALUES ('1004', 'y5', '1');
INSERT INTO factUserInfo VALUES ('1005', 'y6', '1');
INSERT INTO factUserInfo VALUES ('1006', 'y7', '1');
INSERT INTO factUserInfo VALUES ('1007', 'y8', '1');
INSERT INTO factUserInfo VALUES ('1008', 'y9', '1');
INSERT INTO factUserInfo VALUES ('1009', 'y10', '1');
INSERT INTO factUserInfo VALUES ('1010', 'y11', '2');
INSERT INTO factUserInfo VALUES ('1011', 'y12', '2');
INSERT INTO factUserInfo VALUES ('1012', 'y13', '2');
INSERT INTO factUserInfo VALUES ('1013', 'y14', '2');
INSERT INTO factUserInfo VALUES ('1014', 'y15', '2');
INSERT INTO factUserInfo VALUES ('1015', 'y16', '2');
INSERT INTO factUserInfo VALUES ('1016', 'y17', '2');
INSERT INTO factUserInfo VALUES ('1017', 'y18', '2');
INSERT INTO factUserInfo VALUES ('1018', 'y19', '2');
INSERT INTO factUserInfo VALUES ('1019', 'y20', '2');
INSERT INTO factUserInfo VALUES ('1020', 'y21', '2');
INSERT INTO factUserInfo VALUES ('1021', 'y22', '2');