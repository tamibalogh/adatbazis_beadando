--Az adatbázis összes adata
SELECT 
    c.nev AS csapat_neve,
    m.hazai_csapat_id,
    m.vendeg_csapat_id,
    m.szerzett_gol AS hazai_szerzett_gol,
    m.kapott_gol AS hazai_kapott_gol,
    (CASE WHEN m.hazai_csapat_id = c.id THEN 'hazai' ELSE 'vendég' END) AS helyszin,
    m.fordulo_id
FROM 
    merkozesek m
JOIN 
    csapatok c ON m.hazai_csapat_id = c.id OR m.vendeg_csapat_id = c.id
ORDER BY 
    m.fordulo_id;

--Csapatok sorrendben kapott gólok és szerzett gólok különbsége alapján
SELECT 
    csapat_nev,
    SUM(osszes_szerzett_gol) AS osszes_szerzett_gol,
    SUM(osszes_kapott_gol) AS osszes_kapott_gol,
    SUM(golkulonbseg) AS osszes_golkulonbseg
FROM (
    SELECT 
        CASE WHEN m.hazai_csapat_id = c.id THEN m.szerzett_gol ELSE m.kapott_gol END AS osszes_szerzett_gol,
        CASE WHEN m.hazai_csapat_id = c.id THEN m.kapott_gol ELSE m.szerzett_gol END AS osszes_kapott_gol,
        CASE WHEN m.hazai_csapat_id = c.id THEN m.szerzett_gol - m.kapott_gol ELSE m.kapott_gol - m.szerzett_gol END AS golkulonbseg,
        c.nev AS csapat_nev
    FROM 
        csapatok c
    JOIN 
        merkozesek m ON c.id = m.hazai_csapat_id OR c.id = m.vendeg_csapat_id
) AS sub
GROUP BY 
    csapat_nev
ORDER BY 
    osszes_golkulonbseg DESC;

--Legnagyobb férőhelyű stadion csapatának elnöke
SELECT TOP 1 cs.ELNOK
FROM Csapatok cs JOIN Stadionok s ON cs.ID=s.CSAPATOK_ID
ORDER BY s.FEROHELY DESC

--Fordulónként gólszámok növekvő sorrendben
SELECT f.FORDULO_ID,
       SUM(m.KAPOTT_GOL) + SUM(m.SZERZETT_GOL) AS "GOLSZAMOK"
FROM Merkozesek m JOIN Fordulok f ON m.FORDULO_ID=f.FORDULO_ID
GROUP BY f.FORDULO_ID
ORDER BY SUM(m.KAPOTT_GOL) + SUM(m.SZERZETT_GOL) ASC

--Pancho arénában mikor játszottak, kik, és összesen hány gólt lőttek
SELECT m.HAZAI_CSAPAT_ID,
	   m.VENDEG_CSAPAT_ID,
       f.DATUM, KAPOTT_GOL+SZERZETT_GOL AS "OSSZES GOL"
FROM Merkozesek m JOIN Csapatok cs ON m.HAZAI_CSAPAT_ID=cs.ID
JOIN Stadionok s ON cs.ID=s.CSAPATOK_ID
JOIN Fordulok f ON m.FORDULO_ID=f.FORDULO_ID
WHERE s.STADION_NEV LIKE 'Pancho Aréna'

--Csapatonként szereplések száma és helyezések átlaga a góllövőlistán
SELECT cs.NEV,
	   COUNT(g.CSAPAT_ID) AS "SZEREPLESEK",
       AVG(g.HELYEZES) AS "HELYEZESEK ATLAGA"
FROM Csapatok cs JOIN Gollovolista g ON cs.ID=g.CSAPAT_ID
GROUP BY cs.NEV