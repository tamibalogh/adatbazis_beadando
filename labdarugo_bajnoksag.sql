CREATE TABLE csapatok (
    id               NVARCHAR(20) NOT NULL,
    nev              NVARCHAR(30) NOT NULL,
    elnok            NVARCHAR(30),
    szakmai_igazgato NVARCHAR(30),
    vezetoedzo       NVARCHAR(30),
    csapatkapitany   NVARCHAR(30) NOT NULL
);
ALTER TABLE csapatok ADD CONSTRAINT csapatok_pk PRIMARY KEY ( id );
INSERT INTO csapatok (id,nev,elnok,szakmai_igazgato,vezetoedzo,csapatkapitany) VALUES 
 ('Honvéd','Budapest Honvéd','Bozó Zoltán','Chris Docherty','Dean Klafurić','Ivan Lovrić'), 
 ('Debrecen','Debreceni VSC','Thierry Zaengel','Hayk Hovakimyan','Srđan Blagojević','Dzsudzsák Balázs'), 
 ('Ferencváros','Ferencvárosi TC','Kubatov Gábor','Hajnal Tamás','Sztanyiszlav Csercseszov','Dibusz Dénes'), 
 ('Kecskemét','Kecskeméti TE Hufbau','Filus Andor','Tóth Ákos','Szabó István','Vágó Levente'), 
 ('Kisvárda','Kisvárda FC','Forrás Zoltán','Révész Attila','Miloš Kruščić','Lucas'), 
 ('Mezőkövesd','Mezőkövesd Zsóry FC','Tállai András','Tóth László','Kuttor Attila','Cseri Tamás'), 
 ('MOL Fehérvár','MOL Fehérvár FC','Garancsi István','Juhász Roland','Bartosz Grzelak','Fiola Attila'), 
 ('Paks','Paksi FC','Bognár Péter','Haraszti Zsolt','Bognár György','Szabó János'), 
 ('Puskás Akadémia','Puskás Akadémia','Mészáros Lőrinc','Tóth Balázs','Hornyák Zsolt','Szolnoki Roland'), 
 ('Újpest','Újpest FC','Roderick Duchâtelet','Kabát Péter','Nebojša Vignjević','Đorđe Nikolić'), 
 ('Vasas','Vasas FC','Nagy György','Nagy Miklós','Desits Szilárd','Berecz Zsombor'), 
 ('Zalaegerszeg','Zalaegerszegi TE FC','Végh Gábor','Sallói István','Boér Gábor','Kálnoki Kis Dávid');

CREATE TABLE fordulok (
    fordulo_id INTEGER NOT NULL,
    datum      DATE
);
ALTER TABLE fordulok ADD CONSTRAINT fordulok_pk PRIMARY KEY ( fordulo_id );
INSERT INTO fordulok (fordulo_id,datum) VALUES 
 ('1','2022-07-30'), 
 ('2','2022-08-06'), 
 ('3','2022-08-13'), 
 ('4','2022-08-21'), 
 ('5','2022-08-27'), 
 ('6','2022-08-31'), 
 ('7','2022-09-03'), 
 ('8','2022-09-10'), 
 ('9','2022-10-01'), 
 ('10','2022-10-08'), 
 ('11','2022-10-15'), 
 ('12','2022-10-11'), 
 ('13','2022-10-29'), 
 ('14','2022-11-05'), 
 ('15','2022-11-09'), 
 ('16','2022-11-12'), 
 ('17','2023-01-28'), 
 ('18','2023-02-04'), 
 ('19','2023-02-11'), 
 ('20','2023-02-18'), 
 ('21','2023-02-25'), 
 ('22','2023-03-04'), 
 ('23','2023-03-11'), 
 ('24','2023-03-18'), 
 ('25','2023-04-01'), 
 ('26','2023-04-08'), 
 ('27','2023-04-15'), 
 ('28','2023-04-22'), 
 ('29','2023-04-29'), 
 ('30','2023-05-06'), 
 ('31','2023-05-13'), 
 ('32','2023-05-20'), 
 ('33','2023-05-27');

CREATE TABLE gollovolista (
  	helyezes       INTEGER NOT NULL,
  	jatekos        NVARCHAR(30) NOT NULL,
    csapat_id      NVARCHAR(20) NOT NULL,
    szerzett_golok INTEGER NOT NULL
);
ALTER TABLE gollovolista ADD CONSTRAINT gollovolista_pk PRIMARY KEY ( jatekos );
ALTER TABLE gollovolista
    ADD CONSTRAINT gollovolista_csapatok_fk FOREIGN KEY ( csapat_id )
        REFERENCES csapatok ( id );
INSERT INTO gollovolista (helyezes,jatekos,csapat_id,szerzett_golok) VALUES 
 ('1','Varga Barnabás','Paks','26'), 
 ('2','Sztefan Drazsics','Mezőkövesd','14'), 
 ('3','Dorian Babunszki','Debrecen','13'), 
 ('3','Kenan Kodro','MOL Fehérvár','13'), 
 ('3','Nenad Lukics','Honvéd','13'), 
 ('6','Ryan Mmaee','Ferencváros','12'), 
 ('7','Eduvie Ikoba','Zalaegerszeg','11'), 
 ('7','Adama Traoré','Ferencváros','11'), 
 ('9','Dino Beširović','Mezőkövesd','8'), 
 ('9','Fernand Gouré','Újpest','8'), 
 ('9','Holender Filip','Vasas','8'), 
 ('9','Katona Bálint','Kecskemét','8'), 
 ('9','Jasmin Mešanović','Kisvárda','8'), 
 ('9','Sahab Zahedi','Puskás Akadémia','8'), 
 ('15','Rafał Makowski','Kisvárda','7'), 
 ('15','Kristoffer Zachariassen','Ferencváros','7'), 
 ('17','Marius Corbu','Puskás Akadémia','6'), 
 ('17','Driton Camaj','Kisvárda','6'), 
 ('17','Dzsudzsák Balázs','Debrecen','6'), 
 ('17','Artem Favorov','Puskás Akadémia','6'), 
 ('17','Horváth Krisztofer','Kecskemét','6'), 
 ('17','Nagy Krisztián','Kecskemét','6'), 
 ('17','Tóth Barna','Kecskemét','6'), 
 ('17','Windecker József','Paks','6'), 
 ('25','Banó-Szabó Bence','Kecskemét','5'), 
 ('25','Berecz Zsombor','Vasas','5'), 
 ('25','Böde Dániel','Paks','5'), 
 ('25','Csoboth Kevin','Újpest','5'), 
 ('25','Dárdai Palkó','MOL Fehérvár','5'), 
 ('25','Mario Ilievski','Kisvárda','5'), 
 ('25','Lisztes Krisztián','Ferencváros','5'), 
 ('25','Marquinhos','Ferencváros','5'), 
 ('25','Novothny Soma','Vasas','5'), 
 ('25','Simon Krisztián','Újpest','5'), 
 ('25','Szécsi Márk','Debrecen','5');
 
 CREATE TABLE stadionok (
  	csapatok_id NVARCHAR(20) NOT NULL,  
  	stadion_nev NVARCHAR(40) NOT NULL,
  	stadion_id  INTEGER NOT NULL,
  	epites      INTEGER,
    ferohely    INTEGER
);
CREATE UNIQUE INDEX stadionok__idx ON
    stadionok (
        csapatok_id
    ASC );
ALTER TABLE stadionok
    ADD CONSTRAINT stadionok_csapatok_fk FOREIGN KEY ( csapatok_id )
        REFERENCES csapatok ( id );
ALTER TABLE stadionok ADD CONSTRAINT stadionok_pk PRIMARY KEY ( stadion_id );
INSERT INTO stadionok (csapatok_id,stadion_nev,stadion_id,epites,ferohely) VALUES 
 ('Kisvárda','Várkerti Stadion','1','2018','2850'), 
 ('Puskás Akadémia','Pancho Aréna','2','2014','3816'), 
 ('Mezőkövesd','Városi-Stadion','3','2013','4183'), 
 ('Vasas','Illovszky Rudolf Stadion','4','2019','5145'), 
 ('Paks','Fehérvári úti stadion','5','2020','6150'), 
 ('Kecskemét','Széktói Stadion','6','2002','6300'), 
 ('Honvéd','Bozsik Aréna','7','2021','8200'), 
 ('Zalaegerszeg','ZTE Aréna','8','2016','11200'), 
 ('Újpest','Szusza Ferenc Stadion','9','2001','13501'), 
 ('MOL Fehérvár','MOL Aréna Sóstó','10','2018','14201'), 
 ('Debrecen','Nagyerdei stadion','11','2014','20340'), 
 ('Ferencváros','Groupama Aréna','12','2014','22000');
 
 CREATE TABLE merkozesek (
    hazai_csapat_id  NVARCHAR(20) NOT NULL,
    vendeg_csapat_id NVARCHAR(20) NOT NULL,
    kapott_gol       INTEGER,
    szerzett_gol     INTEGER,
    fordulo_id       INTEGER NOT NULL,
  	PRIMARY KEY (hazai_csapat_id, vendeg_csapat_id, fordulo_id)
);
ALTER TABLE merkozesek
    ADD CONSTRAINT merkozesek_hazai_fk FOREIGN KEY (hazai_csapat_id)
        REFERENCES csapatok (id);
ALTER TABLE merkozesek
    ADD CONSTRAINT merkozesek_vendeg_fk FOREIGN KEY (vendeg_csapat_id)
        REFERENCES csapatok (id);
ALTER TABLE merkozesek
    ADD CONSTRAINT merkozesek_fordulok_fk FOREIGN KEY (fordulo_id)
        REFERENCES fordulok (fordulo_id);
INSERT INTO merkozesek (fordulo_id,hazai_csapat_id,szerzett_gol,kapott_gol,vendeg_csapat_id) VALUES 
 ('1','Kecskemét','0','0','Vasas'), 
 ('1','Kisvárda','2','2','Debrecen'), 
 ('1','Újpest','1','1','Mezőkövesd'), 
 ('1','Ferencváros','1','0','Puskás Akadémia'), 
 ('1','Honvéd','0','1','Zalaegerszeg'), 
 ('1','Paks','2','0','MOL Fehérvár'), 
 ('2','Kisvárda','4','2','Mezőkövesd'), 
 ('2','Debrecen','1','1','Kecskemét'), 
 ('2','MOL Fehérvár','4','0','Honvéd'), 
 ('2','Zalaegerszeg','1','2','Ferencváros'), 
 ('2','Puskás Akadémia','2','0','Újpest'), 
 ('2','Vasas','2','2','Paks'), 
 ('3','Debrecen','1','1','Vasas'), 
 ('3','Kecskemét','1','0','Mezőkövesd'), 
 ('3','Kisvárda','1','1','Puskás Akadémia'), 
 ('3','Újpest','1','1','Zalaegerszeg'), 
 ('3','Ferencváros','4','0','MOL Fehérvár'), 
 ('3','Honvéd','3','3','Paks'), 
 ('4','Mezőkövesd','4','2','Debrecen'), 
 ('4','Paks','1','3','Ferencváros'), 
 ('4','MOL Fehérvár','0','1','Újpest'), 
 ('4','Zalaegerszeg','1','3','Kisvárda'), 
 ('4','Puskás Akadémia','1','1','Kecskemét'), 
 ('4','Vasas','1','2','Honvéd'), 
 ('5','Mezőkövesd','1','1','Vasas'), 
 ('5','Debrecen','1','1','Puskás Akadémia'), 
 ('5','Kecskemét','3','1','Zalaegerszeg'), 
 ('5','Kisvárda','3','1','MOL Fehérvár'), 
 ('5','Újpest','2','3','Paks'), 
 ('5','Ferencváros','3','1','Honvéd'), 
 ('6','Honvéd','0','0','Újpest'), 
 ('6','Paks','1','3','Kisvárda'), 
 ('6','MOL Fehérvár','2','1','Kecskemét'), 
 ('6','Zalaegerszeg','4','2','Debrecen'), 
 ('6','Puskás Akadémia','1','0','Mezőkövesd'), 
 ('6','Vasas','0','1','Ferencváros'), 
 ('7','Mezőkövesd','0','5','Zalaegerszeg'), 
 ('7','Debrecen','1','0','MOL Fehérvár'), 
 ('7','Kecskemét','3','1','Paks'), 
 ('7','Kisvárda','0','1','Honvéd'), 
 ('7','Újpest','0','6','Ferencváros'), 
 ('7','Vasas','1','1','Puskás Akadémia'), 
 ('8','Újpest','2','1','Vasas'), 
 ('8','Ferencváros','3','0','Kisvárda'), 
 ('8','Honvéd','0','0','Kecskemét'), 
 ('8','Paks','1','0','Debrecen'), 
 ('8','MOL Fehérvár','2','1','Mezőkövesd'), 
 ('8','Zalaegerszeg','1','2','Puskás Akadémia'), 
 ('9','Mezőkövesd','1','2','Paks'), 
 ('9','Debrecen','4','3','Honvéd'), 
 ('9','Kecskemét','2','0','Ferencváros'), 
 ('9','Újpest','4','0','Kisvárda'), 
 ('9','Puskás Akadémia','1','1','MOL Fehérvár'), 
 ('9','Vasas','1','1','Zalaegerszeg'), 
 ('10','Kisvárda','2','0','Vasas'), 
 ('10','Újpest','1','2','Kecskemét'), 
 ('10','Ferencváros','2','0','Debrecen'), 
 ('10','Honvéd','2','2','Mezőkövesd'), 
 ('10','Paks','1','3','Puskás Akadémia'), 
 ('10','MOL Fehérvár','1','1','Zalaegerszeg'), 
 ('11','Mezőkövesd','2','1','Ferencváros'), 
 ('11','Debrecen','4','1','Újpest'), 
 ('11','Kecskemét','3','3','Kisvárda'), 
 ('11','Zalaegerszeg','3','0','Paks'), 
 ('11','Puskás Akadémia','1','0','Honvéd'), 
 ('11','Vasas','2','0','MOL Fehérvár'), 
 ('12','Vasas','1','2','Kecskemét'), 
 ('12','Debrecen','2','3','Kisvárda'), 
 ('12','Mezőkövesd','1','0','Újpest'), 
 ('12','Puskás Akadémia','2','4','Ferencváros'), 
 ('12','Zalaegerszeg','0','2','Honvéd'), 
 ('12','MOL Fehérvár','1','1','Paks'), 
 ('13','Mezőkövesd','1','1','Kisvárda'), 
 ('13','Kecskemét','2','2','Debrecen'), 
 ('13','Honvéd','0','1','MOL Fehérvár'), 
 ('13','Ferencváros','2','1','Zalaegerszeg'), 
 ('13','Újpest','3','3','Puskás Akadémia'), 
 ('13','Paks','0','1','Vasas'), 
 ('14','Vasas','0','3','Debrecen'), 
 ('14','Mezőkövesd','2','1','Kecskemét'), 
 ('14','Puskás Akadémia','0','1','Kisvárda'), 
 ('14','Zalaegerszeg','1','0','Újpest'), 
 ('14','MOL Fehérvár','2','2','Ferencváros'), 
 ('14','Paks','5','0','Honvéd'), 
 ('15','Debrecen','1','0','Mezőkövesd'), 
 ('15','Ferencváros','3','2','Paks'), 
 ('15','Újpest','2','1','MOL Fehérvár'), 
 ('15','Kisvárda','0','3','Zalaegerszeg'), 
 ('15','Kecskemét','1','1','Puskás Akadémia'), 
 ('15','Honvéd','2','0','Vasas'), 
 ('16','Vasas','1','0','Mezőkövesd'), 
 ('16','Puskás Akadémia','2','1','Debrecen'), 
 ('16','Zalaegerszeg','0','0','Kecskemét'), 
 ('16','MOL Fehérvár','4','1','Kisvárda'), 
 ('16','Paks','3','1','Újpest'), 
 ('16','Honvéd','0','2','Ferencváros'), 
 ('17','Újpest','2','1','Honvéd'), 
 ('17','Kisvárda','2','2','Paks'), 
 ('17','Kecskemét','2','1','MOL Fehérvár'), 
 ('17','Debrecen','3','0','Zalaegerszeg'), 
 ('17','Mezőkövesd','1','0','Puskás Akadémia'), 
 ('17','Ferencváros','0','0','Vasas'), 
 ('18','Zalaegerszeg','0','0','Mezőkövesd'), 
 ('18','MOL Fehérvár','1','1','Debrecen'), 
 ('18','Paks','0','0','Kecskemét'), 
 ('18','Honvéd','1','1','Kisvárda'), 
 ('18','Ferencváros','3','1','Újpest'), 
 ('18','Puskás Akadémia','1','1','Vasas'), 
 ('19','Vasas','0','1','Újpest'), 
 ('19','Kisvárda','0','0','Ferencváros'), 
 ('19','Kecskemét','2','2','Honvéd'), 
 ('19','Debrecen','2','1','Paks'), 
 ('19','Mezőkövesd','2','1','MOL Fehérvár'), 
 ('19','Puskás Akadémia','1','0','Zalaegerszeg'), 
 ('20','Paks','0','2','Mezőkövesd'), 
 ('20','Honvéd','2','3','Debrecen'), 
 ('20','Ferencváros','1','1','Kecskemét'), 
 ('20','Újpest','2','1','Kisvárda'), 
 ('20','MOL Fehérvár','1','1','Puskás Akadémia'), 
 ('20','Zalaegerszeg','0','0','Vasas'), 
 ('21','Vasas','2','2','Kisvárda'), 
 ('21','Kecskemét','2','2','Újpest'), 
 ('21','Debrecen','0','2','Ferencváros'), 
 ('21','Mezőkövesd','0','0','Honvéd'), 
 ('21','Puskás Akadémia','1','4','Paks'), 
 ('21','Zalaegerszeg','2','1','MOL Fehérvár'), 
 ('22','Ferencváros','1','1','Mezőkövesd'), 
 ('22','Újpest','1','1','Debrecen'), 
 ('22','Kisvárda','0','1','Kecskemét'), 
 ('22','Paks','3','1','Zalaegerszeg'), 
 ('22','Honvéd','3','1','Puskás Akadémia'), 
 ('22','MOL Fehérvár','2','1','Vasas'), 
 ('23','Kecskemét','2','0','Vasas'), 
 ('23','Kisvárda','0','1','Debrecen'), 
 ('23','Újpest','1','0','Mezőkövesd'), 
 ('23','Ferencváros','1','2','Puskás Akadémia'), 
 ('23','Honvéd','1','0','Zalaegerszeg'), 
 ('23','Paks','2','1','MOL Fehérvár'), 
 ('24','Mezőkövesd','1','1','Kisvárda'), 
 ('24','Debrecen','1','2','Kecskemét'), 
 ('24','MOL Fehérvár','2','0','Honvéd'), 
 ('24','Zalaegerszeg','1','0','Ferencváros'), 
 ('24','Puskás Akadémia','5','1','Újpest'), 
 ('24','Vasas','2','3','Paks'), 
 ('25','Debrecen','3','1','Vasas'), 
 ('25','Kecskemét','0','1','Mezőkövesd'), 
 ('25','Kisvárda','2','2','Puskás Akadémia'), 
 ('25','Újpest','3','2','Zalaegerszeg'), 
 ('25','Ferencváros','2','2','MOL Fehérvár'), 
 ('25','Honvéd','1','2','Paks'), 
 ('26','Mezőkövesd','0','1','Debrecen'), 
 ('26','Paks','3','2','Ferencváros'), 
 ('26','MOL Fehérvár','0','0','Újpest'), 
 ('26','Zalaegerszeg','0','0','Kisvárda'), 
 ('26','Puskás Akadémia','0','3','Kecskemét'), 
 ('26','Vasas','0','1','Honvéd'), 
 ('27','Mezőkövesd','1','4','Vasas'), 
 ('27','Debrecen','0','1','Puskás Akadémia'), 
 ('27','Kecskemét','3','0','Zalaegerszeg'), 
 ('27','Kisvárda','0','0','MOL Fehérvár'), 
 ('27','Újpest','3','2','Paks'), 
 ('27','Ferencváros','3','0','Honvéd'), 
 ('28','Honvéd','0','1','Újpest'), 
 ('28','Paks','2','0','Kisvárda'), 
 ('28','MOL Fehérvár','1','2','Kecskemét'), 
 ('28','Zalaegerszeg','0','2','Debrecen'), 
 ('28','Puskás Akadémia','2','1','Mezőkövesd'), 
 ('28','Vasas','0','1','Ferencváros'), 
 ('29','Mezőkövesd','1','2','Zalaegerszeg'), 
 ('29','Debrecen','2','0','MOL Fehérvár'), 
 ('29','Kecskemét','2','3','Paks'), 
 ('29','Kisvárda','2','2','Honvéd'), 
 ('29','Újpest','2','3','Ferencváros'), 
 ('29','Vasas','2','2','Puskás Akadémia'), 
 ('30','Újpest','1','1','Vasas'), 
 ('30','Ferencváros','3','0','Kisvárda'), 
 ('30','Honvéd','1','0','Kecskemét'), 
 ('30','Paks','0','0','Debrecen'), 
 ('30','MOL Fehérvár','1','1','Mezőkövesd'), 
 ('30','Zalaegerszeg','2','1','Puskás Akadémia'), 
 ('31','Mezőkövesd','6','1','Paks'), 
 ('31','Debrecen','0','0','Honvéd'), 
 ('31','Kecskemét','2','0','Ferencváros'), 
 ('31','Kisvárda','2','0','Újpest'), 
 ('31','Puskás Akadémia','2','1','MOL Fehérvár'), 
 ('31','Vasas','1','1','Zalaegerszeg'), 
 ('32','Kisvárda','2','1','Vasas'), 
 ('32','Újpest','3','0','Kecskemét'), 
 ('32','Ferencváros','1','3','Debrecen'), 
 ('32','Honvéd','2','3','Mezőkövesd'), 
 ('32','Paks','0','2','Puskás Akadémia'), 
 ('32','MOL Fehérvár','3','0','Zalaegerszeg'), 
 ('33','Mezőkövesd','1','0','Ferencváros'), 
 ('33','Debrecen','2','0','Újpest'), 
 ('33','Kecskemét','1','0','Kisvárda'), 
 ('33','Zalaegerszeg','1','1','Paks'), 
 ('33','Puskás Akadémia','2','1','Honvéd'), 
 ('33','Vasas','0','0','MOL Fehérvár');